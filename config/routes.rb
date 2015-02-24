Rails.application.routes.draw do

  get 'blueprint_versions/:id/blueprint', to: "blueprint_versions#blueprint", as: :blueprint_version_blueprint
  get 'blueprint_versions/:id/publish', to: "blueprint_versions#publish", as: :blueprint_version_publish
  get 'blueprint_versions/:id/push_to_local_repository', to: "blueprint_versions#push_to_local_repository", as: :blueprint_version_push_to_local_repository
  get 'blueprint_versions/:id/test_install', to: "blueprint_versions#test_install", as: :blueprint_version_test_install
  get 'blueprint_versions/:id/push_to_repository', to: "blueprint_versions#push_to_repository", as: :blueprint_version_push_to_repository
  get 'blueprint_versions/:id/post_to_gallery', to: "blueprint_versions#post_to_gallery", as: :blueprint_version_post_to_gallery
  get 'blueprint_versions/:id/duplicate', to: "blueprint_versions#duplicate", as: :blueprint_version_duplicate

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
