Rails.application.routes.draw do

  get 'blueprint_versions/:id/build_test', to: "blueprint_versions#build_test", as: :blueprint_version_build_test
  get 'blueprint_versions/:id/blueprint_json', to: "blueprint_versions#blueprint_json", as: :blueprint_version_blueprint_json
  get 'blueprint_versions/:id/reload_service_blueprints', to: "blueprint_versions#reload_service_blueprints", as: :blueprint_version_reload_service_blueprints

  get 'service_configurations/:id/reload_service_definition', to: "service_configurations#reload_service_definition", as: :service_configuration_reload_service_definition

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
