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
    resources :file_write_permissions
    resources :custom_php_inis
    resources :apache_htaccess_files
    resources :apache_modules
	end
  resources :published_softwares      do
     get :detailslist, :on => :collection
   end
 
  resources :published_softwares, :path => "json_published_softwares", :only => [:index,:show,:detailslist ], :defaults => { :format => 'json' }

  resources :softwaredeploytypes
	resources :langauges
  resources :servicetypes do
    resources :service_type_environment_variables
  end
  resources :swframeworks
  resources :licenses
   root 'welcome#index'

end
