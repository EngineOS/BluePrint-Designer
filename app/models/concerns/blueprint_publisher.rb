class BlueprintPublisher

  require 'git'
  require 'rugged'
  require 'digest/sha1'

  def initialize(blueprint_version)
    @blueprint_version = blueprint_version
    gitdir = ENV["GITDIR"]
    gitdir = "/var/lib/git" if gitdir == nil
    @reponame = gitdir + "/blueprints/" + @blueprint_version.software_version.software.to_handle 
  end
  
  def commit_to_local_repository
    p "===== Publishing " + @blueprint_version.software_version.software.to_label
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

  def setup_repo 
    if File.exists?(@reponame)
      repo = Rugged::Repository.new(@reponame)
    else
      FileUtils.mkdir_p(@reponame)
      repo  = Rugged::Repository.init_at(@reponame)
      index = repo.index
      # FileUtils.mkdir_p(@reponame + "/engines/scripts/")
      # FileUtils.mkdir_p(@reponame + "/engines/templates/")
      # FileUtils.mkdir_p(@reponame + "/engines/configs/")
      # FileUtils.mkdir_p(@reponame + "/engines/htaccess_files")
      touchcmd="touch \""+ @reponame +"/.git/git-daemon-export-ok\""
      system(touchcmd )
    end
    return repo
  rescue  Exception=>e
    log_exception(e)
    return false
  end

  def set_repo_options(repo)
    index = repo.index
    options = {}
    options[:tree] = index.write_tree(repo)
    #FIXME email address is of  publisher not system
    options[:author] = { :email => "deploy@engines.onl", :name => 'Software Deployer', :time => Time.now }
    options[:committer] = { :email => "deploy@engines.onl", :name => 'Software Deployer', :time => Time.now }
    options[:message] ||= "updated by Software Deployer at dd-mm-yy:h:m:s logged in as user"
    options[:parents] = repo.empty? ? [] : [ repo.head.target ].compact
    options[:update_ref] = 'HEAD'
    return options
  rescue  Exception=>e
    log_exception(e)
    return false 
  end

  def write_readme
    line = "ReadMe for " + @blueprint_version.software_version.software.to_label + "\n" + @blueprint_version.software_version.software.description.to_s
    file_path =   "README.md" 
    out_file = File.new(@reponame + "/" + file_path,'w')
    out_file.write(line)
    out_file.close
    @index.add(file_path)   
    oid = @repo.write(line, :blob)            
    @index.add(:path => "README.md", :oid => oid, :mode => 0100644)
  end

  def build_repo
    @repo =  setup_repo
    @index = @repo.index
  end

  def load_blueprint
    @blueprint_json = @blueprint_version.to_json 
    @blueprint_json_str = @blueprint_json.to_s
  end

  def write_blueprint
    file_path =  "blueprint.json" 
    out_file = File.new(@reponame + "/" + file_path,'w', :crlf_newline => false)
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
    options = set_repo_options(@repo)   
    Rugged::Commit.create(@repo, options)
    @index.write
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

