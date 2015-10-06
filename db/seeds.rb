User.create!([
  {username: "admin", user_type: nil, email: "admin@engines.onl", password: "EngOS2014", password_confirmation: "EngOS2014"}
])
DeploymentType.create!([
  {name: "Web"},
  {name: "Worker"}
])
Framework.create!([
  {name: "Apache PHP", language_id: 1, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: true, apache_htaccess_files: true, variables: true, component_sources: true},
  {name: "Nginx", language_id: 1, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Rails", language_id: 2, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Sinatra", language_id: 2, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Django", language_id: 3, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Flask", language_id: 3, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Pyramid", language_id: 3, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Jetty", language_id: 4, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Tomcat", language_id: 4, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true}
])
Language.create!([
  {name: "PHP"},
  {name: "Ruby"},
  {name: "Python"},
  {name: "Java"},
  {name: "Node"}
])
License.create!([
  {name: "GPL v2", source_url: nil},
  {name: "GPL v3", source_url: nil},
  {name: "MIT", source_url: nil},
  {name: "Apache v2", source_url: nil}
])
Publisher.create!([
  {name: "Engines", namespace: "EnginesSystem"}
])
ServiceType.create!([
  {name: "File system", path: "filesystem"},
  {name: "DNS", path: nil},
  {name: "Cron", path: nil},
  {name: "MySQL database", path: "database/sql/mysql"},
  {name: "Postgres database", path: "database/sql/pgsql"}
])