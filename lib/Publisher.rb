require 'rugged'

class Publisher
    
  
  def Publisher.set_repo_options(index,repo)
    options = {}
    options[:tree] = index.write_tree(repo)
    #FIXME email address is of  publisher not system
    options[:author] = { :email => "deploy@engines.onl", :name => 'Software Deployer', :time => Time.now }
    options[:committer] = { :email => "deploy@engines.onl", :name => 'Software Deployer', :time => Time.now }
    options[:message] ||= "updated by Software Deployer at dd-mm-yy:h:m:s logged in as user"
    options[:parents] = repo.empty? ? [] : [ repo.head.target ].compact
    options[:update_ref] = 'HEAD'
    return options
  end
  
  def Publisher.get_blueprint software
    ActiveRecord::Base.include_root_in_json = true
        blueprint_json = software.to_json(
        include:
        [
          {softwareservices: {
          only:
          [:name,:dest,:comment],
          methods:
          [:servicetype_name]
          }},
          {persistantdirs: {only: [:path,:comment]}},
          {persistantfiles: {only: [:path,:comment]}},
          {template_files: {only: [:path,:title]}},
          {file_write_permissions: {only: [:path , :title,:recursive]}},
          {replacementstrings: {only: [:sedstr,:file,:dest,:comment]}},    
          {installedpackages: {only: [:name,:src,:dest,:extractcmd,:extractdir,:comment]}},
          {cron_jobs: {only: [ :cronjob,:description]}},
          {ospackages: {only: [:name,:comment]}},
          {blocking_worker: {only: [:name,:comment,:command]}},
          {rake_tasks: {only: [:name,:action]}},
          {environment_variables: {only: [:name,:comment,:value,:ask_at_runtime]}},
          {worker_commands: {only: [:name, :comment,:command]}},
          {work_ports: {only: [:name,:external,:port,:comment]}},
        ] ,
        only:
        #[ :name,:description],
        [ :name,:icon_url,:description,:version,:updated_at,:requiredmemory,:toconfigurefile,:configuredfile],
        methods:
        [:langauge_name,:swframework_name,:license_name,:license_sourceurl]
        )
    
        blueprint_json_str = blueprint_json.to_s
        return blueprint_json_str
  end
  
  def Publisher.setup_repo  software_name
    gitdir=ENV["GITDIR"]
      if gitdir == nil
        gitdir="/var/lib/git"
      end
      reponame=gitdir + "/testdeploy/"+ software_name 
  
      if File.exists?(reponame)
        repo = Rugged::Repository.new(reponame)
      else
        repo  = Rugged::Repository.init_at(reponame)
        touchcmd= String.new
        cpcmd = String.new
  
        FileUtils.mkdir_p(reponame +"/.git/")
       
        touchcmd="touch \""+ reponame +"/.git/git-daemon-export-ok\""
        system(touchcmd )
                
      end
      
    return repo
  end
  
  def Publisher.publishtest software
    
   repo =  setup_repo(software.name)
    
    blueprint_json = get_blueprint(software) 
    blueprint_json_str =blueprint_json.to_s

    require 'digest/sha1'
    #FIXME to be dynamic value and not just filename
    commit_sha = Digest::SHA1.hexdigest 'reponame'

    #FIXME Make more informative
    line = "ReadMe for " + software.name + "\n" + software.description
    oid = repo.write(line, :blob)
    index = repo.index
    index.add(:path => "README.md", :oid => oid, :mode => 0100644)

    line = "#blueprint.json\n" + blueprint_json_str
    oid = repo.write(blueprint_json_str, :blob)
    index.add(:path => "blueprint.json", :oid => oid, :mode => 0100644)

      software.template_files.each() do |template_file |         
        oid = repo.write(template_file.content, :blob)
        index.add(:path => "engines/templates/" + template_file.path, :oid => oid, :mode => 0100644)
      end
    
    options = set_repo_options(index,repo)   
    Rugged::Commit.create(repo, options)
       
    return blueprint_json_str
  end

    
end
