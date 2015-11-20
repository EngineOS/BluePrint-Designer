class RepoCommit

  require 'git'
  require 'rugged'
  require 'digest/sha1'

  def initialize(filename, file_content, username, commit_message, read_me, path_in_repo, repo_path)
    @filename = filename.to_s
    @file_content = file_content.to_s
    @username = username.to_s
    @commit_message = commit_message.to_s
    @read_me = read_me.to_s
    @path_in_repo = path_in_repo.to_s
    @repo_path = repo_path
    @repo_path = (ENV["GITDIR"] || "/var/lib/git") + '/' + @repo_path
  end
  
  def commit
    build_repo
    write_readme
    write_content
    commit_file
    return true
  rescue Exception=>e
    log_exception(e)
    return false
  end

private

  def setup_repo 
    if File.exists?(@repo_path)

p :FILE_EXISTS

      repo = Rugged::Repository.new(@repo_path)
    else

p :NOT_FILE_EXISTS


      FileUtils.mkdir_p(@repo_path)
      repo  = Rugged::Repository.init_at(@repo_path)
      index = repo.index
      touchcmd="touch \""+ @repo_path +"/.git/git-daemon-export-ok\""
      system(touchcmd)
    end
    return repo
  end

  def setup_directory 
    if !File.exists?(@repo_path + '/' + @path_in_repo)
      FileUtils.mkdir_p(@repo_path + '/' + @path_in_repo)
    end
  end

  def set_repo_options
    index = @repo.index
    @options = {}.tap do |options|
      options[:tree] = index.write_tree(@repo)
      #FIXME email address is of  publisher not system
      options[:author] = { :email => "deploy@engines.onl", :name => 'Software Deployer', :time => Time.now }
      options[:committer] = { :email => "deploy@engines.onl", :name => 'Software Deployer', :time => Time.now }
      options[:message] ||= "#{@commit_message.to_s}\n(commit by user: #{@username})"
      options[:parents] = @repo.empty? ? [] : [ @repo.head.target ].compact
      options[:update_ref] = 'HEAD'
    end
    return true
  # rescue  Exception=>e
  #   log_exception(e)
  #   return false 
  end

  def write_readme
    filename =   "readme.txt" 
    out_file = File.new(@repo_path + "/" + @path_in_repo + "/" + filename,'w')
    out_file.write(@read_me)
    out_file.close
    @index.add(@path_in_repo + '/' + filename)   
    oid = @repo.write(@read_me, :blob)            
    @index.add(:path => (@path_in_repo + '/' + filename), :oid => oid, :mode => 0100644)
  end

  def build_repo
    @repo =  setup_repo
    @index = @repo.index
    setup_directory
  end


  def write_content
    out_file = File.new(@repo_path + "/" + @path_in_repo + '/' + @filename,'w', :crlf_newline => false)
    out_file.write(@file_content)
    out_file.close
    @index.add(@path_in_repo + '/' + @filename)
    @index.write
    line = "#blueprint.json\n" + @file_content
    oid = @repo.write(@file_content, :blob)
    @index.add(:path => (@path_in_repo + '/' + @filename), :oid => oid, :mode => 0100644)
  end

  def commit_file
    tree = @index.write_tree
    if set_repo_options  
      Rugged::Commit.create(@repo, @options)
      @index.write
    end
  end

  def log_exception(e)
    e_str = e.to_s
    p e_str
    puts e_str
    e_str=""
    e.backtrace.each do |bt |
      e_str += bt
    end
    p e_str
  end  

end 

