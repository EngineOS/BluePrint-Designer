require 'rugged'

class Publisher

  
  def Publisher.set_repo_options(index,repo)
    p :repo
   p repo
   p :index
   p index
   
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
  
  def Publisher.get_blueprint software
    ActiveRecord::Base.include_root_in_json = true
        blueprint_json = software.to_json(
        include:
        [
          {softwareservices: {
          only:
          [:name,:dest,:comment,:http_protocol], 
          methods:
          [:servicetype_name]
          }},
          {persistantdirs: {only: [:path,:comment]}},
          {persistantfiles: {only: [:path,:comment]}},
          {template_files: {only: [:path,:title]}},
          {file_write_permissions: {only: [:path , :title,:recursive]}},
          {custom_php_inis: {only: [:title]}}, 
          {replacementstrings: {only: [:sedstr,:file,:dest,:comment]}},    
          {installedpackages: {only: [:name,:src,:dest,:extractcmd,:extractdir,:comment]}},
          {cron_jobs: {only: [ :cronjob,:description]}},
          {ospackages: {only: [:name,:comment]}},
          {blocking_worker: {only: [:name,:comment,:command]}},
          {rake_tasks: {only: [:name,:action]}},
          {template_files: {only: [:title,:path]}},
          {environment_variables: {only: [:name,:comment,:value,:ask_at_build_time,:mandatory,:build_time_only]}},
          {worker_commands: {only: [:name, :comment,:command]}},
          {work_ports: {only: [:name,:external,:port,:comment]}},
          {apache_htaccess_files: {only: [:directory,:comment]}}, 
          {apache_modules: {only: [:module,:comment]}},  
        ] ,
        only:
        #[ :name,:description],
        [ :name,:icon_url,:description,:version,:updated_at,:requiredmemory,:toconfigurefile,:configuredfile],
        methods:
        [:langauge_name,:swframework_name,:license_name,:license_sourceurl,:have_custom_start_script,:have_custom_install_script,:have_custom_post_install_script,:have_php_ini]
        )

        blueprint_json_str = blueprint_json.to_s
        p blueprint_json_str
        return blueprint_json_str
        
rescue  Exception=>e
       log_exception(e)
       return false
  end
  
  def Publisher.setup_repo  software_name
    gitdir=ENV["GITDIR"]
      if gitdir == nil
        gitdir="/var/lib/git"
      end
      reponame=gitdir + "/test-deploy/"+ software_name 
  
  p :reponame
  p reponame
  
      if File.exists?(reponame)
        repo = Rugged::Repository.new(reponame)
       

      else
        repo  = Rugged::Repository.init_at(reponame)
        touchcmd= String.new
        cpcmd = String.new
  
        FileUtils.mkdir_p(reponame +"/.git/")

        FileUtils.mkdir_p(reponame + "/engines/scripts/")
        FileUtils.mkdir_p(reponame + "/engines/templates/")
        FileUtils.mkdir_p(reponame + "/engines/configs/")
        FileUtils.mkdir_p(reponame + "/engines/htaccess_files")
        
#        index.add_entry(IndexEntry.new(:path => "engines",:mode => 0100755))
#       index.add_entry(:path => "engines/templates",:mode => 0100755)
   #      htaccess
   #      configs
   #      scripts
        touchcmd="touch \""+ reponame +"/.git/git-daemon-export-ok\""
        system(touchcmd )
                
      end
      
    return repo
    rescue  Exception=>e
           log_exception(e)
           return false
  end
  
  def Publisher.publishtest software
    p software.name
   repo =  setup_repo(software.name)
    
    blueprint_json = get_blueprint(software) 
    blueprint_json_str =blueprint_json.to_s

    require 'digest/sha1'
 
    commit_sha = Digest::SHA1.hexdigest(blueprint_json.to_s)

    #FIXME Make more informative
    line = "ReadMe for " + software.name + "\n" + software.description
    oid = repo.write(line, :blob)
    index = repo.index
    index.add(:path => "README.md", :oid => oid, :mode => 0100644)

    line = "#blueprint.json\n" + blueprint_json_str
    oid = repo.write(blueprint_json_str, :blob)
    index.add(:path => "blueprint.json", :oid => oid, :mode => 0100644)
    
      #engines_index = Index.new("engines")
      index.add_entry(IndexEntry.new(:path => "engines",:mode => 0100755))
    index.add_entry(:path => "engines/templates",:mode => 0100755)
#      htaccess
#      configs
#      scripts
      
      software.template_files.each() do |template_file |         
        oid = repo.write(template_file.content, :blob)
        index.add(:path => "engines/templates/" + template_file.path, :oid => oid, :mode => 0100644)
      end
  
      software.apache_htaccess_files.each() do |htaccess_file|
        oid = repo.write(htaccess_file.htaccess_content, :blob)
        index.add(:path => "engines/htaccess_files/" + htaccess_file.directory + "/htaccess", :oid => oid, :mode => 0100644)
      end
            
      php_ini = String.new
      software.custom_php_inis.each() do |custom_php|
        php_ini+="#" + custom_php.title + "\n" + custom_php.content + "\n"        
      end
      
      if php_ini.length >1
        oid = repo.write(php_ini, :blob)
         index.add(:path => "engines/configs/php/71-custom.ini", :oid => oid, :mode => 0100644)
      end      
      
       if software.have_custom_start_script == true
         oid = repo.write(software.custom_start_script, :blob)
         index.add(:path => "engines/scripts/start.sh", :oid => oid, :mode => 0100755)
       end
       
       if software.have_custom_install_script == true
         oid = repo.write(software.custom_install_script, :blob)
         index.add(:path => "engines/scripts/install.sh", :oid => oid, :mode => 0100755)
       end
       
       if software.have_custom_post_install_script == true
         oid = repo.write(software.custom_post_install_script, :blob)
         index.add(:path => "engines/scripts/post_install.sh", :oid => oid, :mode => 0100755)
       end
      
    options = set_repo_options(index,repo)   
    Rugged::Commit.create(repo, options)
   
    index.write #????
    
    return blueprint_json_str
    rescue  Exception=>e
           log_exception(e)
           return false
  end

  protected
def Publisher.log_exception(e)
  
   e_str = e.to_s()
   p e_str
   puts e_str
   e_str=""
   e.backtrace.each do |bt |
     e_str += bt
   end
  
   p  e_str
 end  

end 

