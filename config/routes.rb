Rails.application.routes.draw do
	resources :softwares	do
	  get :publish, :on => :member
    get :editDetails, :on => :member
    get :testBuild, :on => :member
	 resources :persistantfiles
	 resources :persistantdirs
	 resources :replacementstrings
	 resources :ospackages
	 resources :installedpackages
    resources :softwareservices
    resources :cron_jobs
    resources :work_ports
    resources :blocking_workers
    resources :worker_commands
    resources :environment_variables
    resources :rake_tasks
    resources :template_files
	end
 
  resources :softwaredeploytypes
	resources :langauges
  resources :servicetypes 
  resources :swframeworks
  resources :licenses
   root 'welcome#index'

end
