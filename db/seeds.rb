User.create!([
  {username: "admin", user_type: nil, email: "admin@engines.onl", password: "EngOS2014", password_confirmation: "EngOS2014"}
])
ApacheModule.create!([
  {os_package: "", module: "rewrite", blueprint_version_id: 2}
])
DeploymentType.create!([
  {name: "Web"},
  {name: "Worker"}
])
Framework.create!([
  {name: "Apache PHP", language_id: 1, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: true, apache_htaccess_files: true, apache_modules: true, variables: true, component_sources: true},
  {name: "Nginx", language_id: 1, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Rails", language_id: 2, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Sinatra", language_id: 2, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Django", language_id: 3, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Flask", language_id: 3, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Pyramid", language_id: 3, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Jetty", language_id: 4, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true},
  {name: "Tomcat", language_id: 4, service_configurations: true, persistent_directories: true, replacement_strings: true, persistent_files: true, installed_packages: true, system_packages: true, ports: true, workers: true, rake_tasks: false, template_files: true, file_write_permissions: true, custom_php_inis: false, apache_htaccess_files: false, apache_modules: false, variables: true, component_sources: true}
])
InstalledPackage.create!([
  {name: "simpleinvoices.2011.1.zip", source_url: "http://download.simpleinvoices.org/simpleinvoices/downloads/simpleinvoices.2011.1.zip", destination: "./", extraction_command: "unzip -u", path_to_extracted: "simpleinvoices", blueprint_version_id: 2}
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
# PersistentDirectory.create!([
#   {path: "app/config", blueprint_version_id: 2},
#   {path: "app/tmp", blueprint_version_id: 2}
# ])
Publisher.create!([
  {name: "Engines", namespace: "EnginesSystem"},
  {name: "Odoo S.A.", namespace: nil}
])
# ReplacementString.create!([
#   {replacement_string: "/database.params.host.*/s//database.params.host =\\\\'$dbhost\\\\'/ ", file: "config/config.ini", destination: "config/config.ini", blueprint_version_id: 2},
#   {replacement_string: "/database.params.username.*/s//database.params.username=\\\\'$dbuser\\\\'/ ", file: "config/config.ini", destination: "config/config.ini", blueprint_version_id: 2},
#   {replacement_string: "/database.params.password.*/s//database.params.password=\\\\'$dbpasswd\\\\'/ \\t", file: "config/config.ini", destination: "config/config.ini", blueprint_version_id: 2},
#   {replacement_string: "/database.params.dbname.*/s//database.params.dbname=\\\\'$dbname\\\\'/ ", file: "config/config.ini", destination: "config/config.ini", blueprint_version_id: 2},
#   {replacement_string: "/phpSettings.date.timezone.*/s//phpSettings.date.timezone=$TZ/ ", file: "config/config.ini", destination: "config/config.ini", blueprint_version_id: 2}
# ])
ServiceDefinition.create!([
  {service_type_id: 4, publisher_id: 1},
  {service_type_id: 5, publisher_id: 1},
  {service_type_id: 1, publisher_id: 1}
])
ServiceType.create!([
  {name: "File system", path: "filesystem"},
  {name: "DNS", path: nil},
  {name: "Cron", path: nil},
  {name: "MySQL database", path: "database/sql/mysql"},
  {name: "Postgres database", path: "database/sql/pgsql"}
])
Software.create!([
  {full_title: "Etherpad", short_title: "", description: "", icon_url: "http://upload.wikimedia.org/wikipedia/commons/f/ff/Logo_Etherpad.png", language_id: 1, license_id: 2, framework_id: 1, deployment_type_id: 1, publisher_id: 1, component_path: "", extract_components: false},
  {full_title: "Odoo", short_title: nil, description: nil, icon_url: nil, language_id: nil, license_id: nil, framework_id: nil, deployment_type_id: nil, publisher_id: 2, component_path: nil, extract_components: nil},
  {full_title: "Simple Invoices", short_title: "", description: "", icon_url: "http://www.sqlfusion.com/blog/wp-content/uploads/2010/04/header_simple_invoices_logo.jpg", language_id: 1, license_id: 2, framework_id: 1, deployment_type_id: 1, publisher_id: 1, component_path: "", extract_components: false}
])
SoftwareVersion.create!([
  {version: "1.5.1", software_id: 1},
  {version: "2011.1", software_id: 3}
])
BlueprintVersion.create!([
  {name: "v0.0.0.1", major: nil, minor: nil, release_level: nil, patch: nil, software_version_id: 1, blocking_worker_id: nil, required_memory: nil, recommended_memory: nil, http_protocol: nil, framework_port_overide: nil, custom_start_script: nil, custom_install_script: nil, custom_post_install_script: nil},
  {name: "Base package", major: 0, minor: 0, release_level: 0, patch: 0, software_version_id: 2, blocking_worker_id: nil, required_memory: 96, recommended_memory: 128, http_protocol: 0, framework_port_overide: nil, custom_start_script: "", custom_install_script: "", custom_post_install_script: ""}
])
# ServiceConfiguration.create!([
#   {service_definition_id: "1", blueprint_version_id: 2},
#   {service_definition_id: "3", blueprint_version_id: 2}
# ])
# ServiceConfigurationVariable.create!([
#   {service_configuration_id: "1"},
#   {service_configuration_id: "2"}
# ])
# Variable.create!([
#   {variable_consumer_id: 1, variable_consumer_type: "ServiceConfigurationVariable", name: "database_host", value: "mysql.engines.internal", value_confirmation: nil, label: "database_host", field_type: "text_field", select_collection: "", tooltip: "Local or the ip address/hostname of the database server", hint: " ", placeholder: " ", comment: " ", regex_validator: ".*", regex_invalid_message: "wrong go back and try again", mandatory: true, ask_at_build_time: false, build_time_only: false, immutable: false, lookup_system_values: false, deprecated: false},
#   {variable_consumer_id: 1, variable_consumer_type: "ServiceConfigurationVariable", name: "database_name", value: "$Engine.name", value_confirmation: "", label: "Database name", field_type: "text_field", select_collection: "", tooltip: "", hint: "", placeholder: "", comment: "", regex_validator: ".*", regex_invalid_message: "wrong go back and try again", mandatory: true, ask_at_build_time: false, build_time_only: false, immutable: false, lookup_system_values: true, deprecated: false},
#   {variable_consumer_id: 1, variable_consumer_type: "ServiceConfigurationVariable", name: "db_username", value: "$Engine.name", value_confirmation: "", label: "DB User Name", field_type: "text_field", select_collection: "", tooltip: "", hint: "", placeholder: "", comment: "", regex_validator: ".*", regex_invalid_message: "wrong go back and try again", mandatory: true, ask_at_build_time: false, build_time_only: false, immutable: false, lookup_system_values: false, deprecated: false},
#   {variable_consumer_id: 1, variable_consumer_type: "ServiceConfigurationVariable", name: "db_password", value: "$Engine.name", value_confirmation: "$Engine.name", label: "DB Password", field_type: "password_with_confirmation", select_collection: "", tooltip: "", hint: "", placeholder: "", comment: "", regex_validator: ".*", regex_invalid_message: "wrong go back and try again", mandatory: true, ask_at_build_time: false, build_time_only: false, immutable: false, lookup_system_values: false, deprecated: false},
#   {variable_consumer_id: 2, variable_consumer_type: "ServiceConfigurationVariable", name: "volume_src", value: "", value_confirmation: "", label: "volume src path", field_type: "text_field", select_collection: "", tooltip: "", hint: "", placeholder: "", comment: "", regex_validator: ".*", regex_invalid_message: "", mandatory: false, ask_at_build_time: false, build_time_only: false, immutable: false, lookup_system_values: false, deprecated: false},
#   {variable_consumer_id: 2, variable_consumer_type: "ServiceConfigurationVariable", name: "permissions", value: "rw", value_confirmation: nil, label: "permissions", field_type: "select_single", select_collection: "[\"rw\", \"ro\"]", tooltip: " ", hint: " ", placeholder: " ", comment: " ", regex_validator: ".*", regex_invalid_message: nil, mandatory: true, ask_at_build_time: false, build_time_only: false, immutable: false, lookup_system_values: false, deprecated: false},
#   {variable_consumer_id: 2, variable_consumer_type: "ServiceConfigurationVariable", name: "engine_path", value: "/home/fs", value_confirmation: "", label: "engine_path", field_type: "text_field", select_collection: "", tooltip: "", hint: "", placeholder: "", comment: "", regex_validator: ".*", regex_invalid_message: "", mandatory: true, ask_at_build_time: false, build_time_only: false, immutable: false, lookup_system_values: false, deprecated: false}
# ])
