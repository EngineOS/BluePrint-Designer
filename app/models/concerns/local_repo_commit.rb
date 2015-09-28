class LocalRepoCommit

  require 'git'
  require 'rugged'
  require 'digest/sha1'

  def initialize(package_handle, blueprint_json, username, commit_message, read_me)
    @package_handle = package_handle.to_s
    @blueprint_json = blueprint_json.to_s
    @username = username.to_s
    @commit_message = commit_message.to_s
    @read_me = read_me.to_s
  end
  
  def commit
    set_repo_name
    build_repo
    write_readme
    load_blueprint
    write_blueprint
    commit_blueprint
    return true
  rescue Exception=>e
    log_exception(e)
    return false
  end

private

  def set_repo_name
    gitdir = ENV["GITDIR"] || "/var/lib/git"
    @repo_name = gitdir + "/blueprints/" + @package_handle
  end

  def setup_repo 
    if File.exists?(@repo_name)
      repo = Rugged::Repository.new(@repo_name)
    else
      FileUtils.mkdir_p(@repo_name)
      repo  = Rugged::Repository.init_at(@repo_name)
      index = repo.index
      touchcmd="touch \""+ @repo_name +"/.git/git-daemon-export-ok\""
      system(touchcmd)
    end
    return repo
  # rescue  Exception=>e
  #   log_exception(e)
  #   return false
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
    file_path =   "README.md" 
    out_file = File.new(@repo_name + "/" + file_path,'w')
    out_file.write(@read_me)
    out_file.close
    @index.add(file_path)   
    oid = @repo.write(@read_me, :blob)            
    @index.add(:path => "README.md", :oid => oid, :mode => 0100644)
  end

  def build_repo
    @repo =  setup_repo
    @index = @repo.index
  end

  def load_blueprint
    @blueprint_json = @blueprint_json 
    @blueprint_json_str = @blueprint_json.to_s
  end

  def write_blueprint
    file_path =  "blueprint.json" 
    out_file = File.new(@repo_name + "/" + file_path,'w', :crlf_newline => false)
    out_file.write(@blueprint_json_str)
    out_file.close
    @index.add(file_path)
    @index.write
    line = "#blueprint.json\n" + @blueprint_json_str
    oid = @repo.write(@blueprint_json_str, :blob)
    @index.add(:path => "blueprint.json", :oid => oid, :mode => 0100644)
  end

  def commit_blueprint
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

