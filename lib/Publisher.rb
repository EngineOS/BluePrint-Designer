require 'rugged'
class Publisher
  
  def Publisher.publishtest software
    gitdir=ENV["GITDIR"]
    if gitdir == nil
      gitdir="/var/lib/git"
    end
  reponame=gitdir + "/testdeploy/"+ software.name + "-test"

   if File.exists?(reponame)        
        repo = Rugged::Repository.new(reponame)       
     else     
        repo  = Rugged::Repository.init_at(reponame)
        touchcmd= String.new
        cpcmd = String.new      
        
        mkdircmd = "mkdir -p \""+reponame +"/.git/\""
          puts mkdircmd
        system(mkdircmd)
        touchcmd="touch \""+ reponame +"/.git/git-daemon-export-ok\""
        system(touchcmd ) 
        
     end
    
  
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
                {replacementstrings: {only: [:sedstr,:file,:dest,:comment]}},
              
                {installedpackages: {only: [:name,:src,:dest,:extractcmd,:extractdir,:comment]}},
                {cron_jobs: {only: [ :cronjob,:description]}},
                {ospackages: {only: [:name,:comment]}},
                {blocking_worker: {only: [:name,:comment,:command]}},
                {environment_variables: {only: [:name,:comment,:value,:ask_at_runtime]}},
                {worker_commands: {only: [:name, :comment,:command]}},
                {work_ports: {only: [:name,:external,:port,:comment]}},
                ] , 
              only:
              #[ :name,:description],
                [ :name,:description,:version,:updated_at,:requiredmemory,:toconfigurefile,:configuredfile],
              methods: 
                     [:langauge_name,:swframework_name,:license_name]
                     )
  
     
blueprint_json_str= cjs.to_s
  
  require 'digest/sha1'
  #FIXME to be dynamic value and not just filename
  commit_sha = Digest::SHA1.hexdigest 'reponame'
  
  
    #FIXME Make more informative
           line = "ReadMe for " + software.name + "\n" + software.description
        oid = repo.write(line, :blob)
      index = repo.index
  #index.read_tree(repo.head.master.tree)
  #index.add(:path => "README.md", :oid => oid, :mode => 0100644)
      index.add(:path => "README.md", :oid => oid, :mode => 0100644)
      
      
      line = "#blueprint.json\n" + blueprint_json_str
      oid = repo.write(blueprint_json_str, :blob)
      index.add(:path => "blueprint.json", :oid => oid, :mode => 0100644)
  
  
      options = {}
      options[:tree] = index.write_tree(repo)
  #FIXME email address is of  publisher not system
      options[:author] = { :email => "deploy@enginepad.com", :name => 'Software Deployer', :time => Time.now }
      options[:committer] = { :email => "deploy@enginepad.com", :name => 'Software Deployer', :time => Time.now }
      options[:message] ||= "updated by Software Deployer at dd-mm-yy:h:m:s logged in as user"
      options[:parents] = repo.empty? ? [] : [ repo.head.target ].compact
      options[:update_ref] = 'HEAD'
  
      Rugged::Commit.create(repo, options)
      puts blueprint_json_str
      return blueprint_json_str
  end
end