Rails.application.routes.draw do

  resources :publishers,
            :languages,
            :frameworks,
            :licenses,
            :deployment_types,
            :service_types,
            :service_blueprints,
            :softwares,
            :software_versions,
            :blueprint_versions,
            :service_configurations,
            :persistent_directories,
            :replacement_strings,
            :persistent_files,
            :installed_packages,
            :system_packages,
            :ports,
            :workers,
            :rake_tasks,
            :template_files,
            :file_write_permissions,
            :custom_php_inis,
            :apache_htaccess_files,
            :apache_modules,
            :variables,
            :component_directories,
            :component_sources

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'welcome#index'
    end
    unauthenticated do
      root to: 'devise/sessions#new', as: :sign_in_root
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
