Rails.application.routes.draw do
  get '/api/v0/software', to: "libraries#engines_installer_software_json"
  get '/api/v0/software/:id', to: "libraries#individual_software_json"
  get 'blueprint_versions/:id/humanized', to: "blueprint_versions#blueprint", as: :blueprint_version_humanized
  get 'blueprint_versions/:id/blueprint', to: "blueprint_versions#blueprint", as: :blueprint_version_blueprint
  get 'blueprint_versions/:id/publish', to: "blueprint_versions#publish", as: :blueprint_version_publish
  # get 'blueprint_versions/:id/commit_to_local_repository', to: "blueprint_versions#commit_to_local_repository", as: :blueprint_version_commit_to_local_repository
  get 'blueprint_versions/:id/test_install', to: "blueprint_versions#test_install", as: :blueprint_version_test_install
  get 'blueprint_versions/:id/push_to_remote_repository', to: "blueprint_versions#push_to_remote_repository", as: :blueprint_version_push_to_remote_repository
  # get 'blueprint_versions/:id/post_to_gallery', to: "blueprint_versions#post_to_gallery", as: :blueprint_version_post_to_gallery
  get 'blueprint_versions/:id/duplicate', to: "blueprint_versions#duplicate", as: :blueprint_version_duplicate

  get 'service_configurations/:id/reload_service_definition', to: "service_configurations#reload_service_definition", as: :service_configuration_reload_service_definition

  resources :publishers,
            :languages,
            :frameworks,
            :licenses,
            :deployment_types,
            :service_types,
            :service_definitions,
            :service_definition_save_to_repositories,
            :service_definition_yamls,
            # :service_definition_commits,
            :accepts,
            :consumers,
            :configurators,
            :target_envs,
            :softwares,
            :software_versions,
            :blueprint_versions,
            :blueprint_saves,
            :service_configurations,
            :persistent_directories,
            :replacement_strings,
            :persistent_files,
            :installed_packages,
            :system_packages,
            :ports,
            :external_repositories,
            :workers,
            :rake_tasks,
            :template_files,
            :file_write_permissions,
            :custom_php_inis,
            :apache_htaccess_files,
            :apache_httpd_configurations,
            :variables,
            :service_configuration_variables,
            :component_directories,
            :component_sources,
            :module_types,
            :blueprint_modules,
            :blueprint_humanizers,
            :blueprint_jsons #,
            # :blueprint_commits

  resource  :welcome,
            :upgrade

  # resource :repository
  resources :repository_service_definitions
  resource :repository_reset_service_definitions, :repository_load_service_definitions

  # user registrations via console or admin panel.
  devise_for :users, :skip => [:registrations]
  # root routes
  get 'user_home', :to => 'user_homes#show', :as => :user_root
  devise_scope :user do
    authenticated :user do
      root to: 'welcomes#show'
    end
    unauthenticated do
      root to: 'devise/sessions#new', as: :sign_in_root
    end
  end
  # recreate the edit routes that were lost by skipping registrations
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resource :commit_setting

  # resources :users do
  #   member do
  #     get :edit_password
  #     patch :edit_password, to: "users#update_password"
  #   end
  # end


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
