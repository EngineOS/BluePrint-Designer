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
   
	end
 
  resources :softwaredeploytypes
	resources :langauges
  resources :servicetypes 
  resources :swframeworks
  resources :licenses
   root 'welcome#index'

end
