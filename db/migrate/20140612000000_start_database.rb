class StartDatabase < ActiveRecord::Migration
  def change

    create_table "apache_custom_site_files" do |t|
      t.text     "site_configuration"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "apache_htaccess_files" do |t|
      t.string   "directory"
      t.text     "htaccess_content"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "apache_httpd_conf_files" do |t|
      t.text     "httpd_configuration"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "apache_modules" do |t|
      t.string   "os_package"
      t.string   "module"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "blueprint_versions" do |t|
      t.string   "name"
      t.integer  "major"
      t.integer  "minor"
      t.integer  "release_level"
      t.integer  "patch"
      t.integer  "software_version_id"
      t.integer  "blocking_worker_id"
      t.integer  "required_memory"
      t.integer  "recommended_memory"
      t.integer  "http_protocol"
      t.integer  "framework_port_overide"
      t.text     "custom_start_script"
      t.text     "custom_install_script"
      t.text     "custom_post_install_script"
      t.timestamps
    end

    create_table "component_sources" do |t|
      t.string   "url"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "custom_php_inis" do |t|
      t.text     "content"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "deployment_types" do |t|
      t.string   "name"
      t.timestamps
    end

    create_table "file_write_permissions" do |t|
      t.string   "path"
      t.boolean  "recursive", default: false
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "frameworks" do |t|
      t.string   "name"
      t.integer  "language_id"
      t.boolean  "service_configurations", default: true
      t.boolean  "persistent_directories", default: true
      t.boolean  "replacement_strings", default: true
      t.boolean  "persistent_files", default: true
      t.boolean  "installed_packages", default: true
      t.boolean  "system_packages", default: true
      t.boolean  "ports", default: true
      t.boolean  "workers", default: true
      t.boolean  "rake_tasks", default: false
      t.boolean  "template_files", default: true
      t.boolean  "file_write_permissions", default: true
      t.boolean  "custom_php_inis", default: false
      t.boolean  "apache_htaccess_files", default: false
      t.boolean  "apache_modules", default: false
      t.boolean  "variables", default: true
      t.boolean  "component_sources", default: true

      t.timestamps
    end

    create_table "installed_packages" do |t|
      t.string   "name"
      t.string   "source_url"
      t.string   "destination"
      t.string   "extraction_command"
      t.string   "path_to_extracted"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "languages" do |t|
      t.string   "name"
      t.timestamps
    end

    create_table "licenses" do |t|
      t.string   "name"
      t.string   "source_url"
      t.timestamps
    end

    create_table "persistent_directories" do |t|
      t.string   "path"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "persistent_files" do |t|
      t.string   "path"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "ports" do |t|
      t.integer  "port"
      t.integer  "blueprint_version_id"
      t.integer  "external"
      t.integer  "protocol"
      t.timestamps
    end

    create_table "publishers" do |t|
      t.string   "name"
      t.string   "namespace"      
      t.timestamps
    end

    create_table "rake_tasks" do |t|
      t.string   "action"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "replacement_strings" do |t|
      t.string   "replacement_string"
      t.string   "file"
      t.string   "destination"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "service_configurations" do |t|
      t.string   "service_definition_id"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "service_definitions" do |t|
      t.integer  "service_type_id"
      t.integer  "publisher_id"
      t.timestamps
    end

    create_table "service_types" do |t|
      t.string   "name"
      t.string   "path"
      t.timestamps
    end

    create_table "softwares" do |t|
      t.string   "full_title"
      t.string   "short_title"
      t.text     "description"
      t.string   "icon_url"
      t.integer  "language_id"
      t.integer  "license_id"
      t.integer  "framework_id"
      t.integer  "deployment_type_id"
      t.integer  "publisher_id"
      t.string   "component_path"
      t.boolean  "extract_components", default: false
      t.timestamps
    end

    create_table "software_versions" do |t|
      t.string   "version"
      t.integer  "software_id"
      t.timestamps
    end

    create_table "system_packages" do |t|
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "template_files" do |t|
      t.string   "title"
      t.string   "path"
      t.text     "content"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "variables" do |t|
      t.integer  "variable_consumer_id"
      t.string   "variable_consumer_type"
      t.string   "name"
      t.string   "value"
      t.string   "value_confirmation"
      t.string   "label"
      t.string   "field_type"
      t.string   "select_collection"
      t.string   "tooltip"
      t.string   "hint"
      t.string   "placeholder"
      t.string   "comment"
      t.string   "regex_validator"
      t.string   "regex_invalid_message"
      t.boolean  "mandatory", default: false
      t.boolean  "ask_at_build_time", default: false
      t.boolean  "build_time_only", default: false
      t.boolean  "immutable", default: false
      t.boolean  "lookup_system_values", default: false
      t.boolean  "deprecated", default: false
      t.timestamps
    end

    create_table "workers" do |t|
      t.string   "name"
      t.string   "command"
      t.integer  "blueprint_version_id"
      t.timestamps
    end

    create_table "worker_ports" do |t|
      t.string   "command"
      t.integer  "worker_id"
      t.integer  "port_id"
      t.timestamps
    end

  end
end