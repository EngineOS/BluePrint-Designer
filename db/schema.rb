# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151113005029) do

  create_table "accepts", force: true do |t|
    t.integer "service_definition_id"
    t.integer "service_type_id"
  end

  create_table "apache_custom_site_files", force: true do |t|
    t.text     "site_configuration"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apache_htaccess_files", force: true do |t|
    t.string   "directory"
    t.text     "htaccess_content"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apache_httpd_configurations", force: true do |t|
    t.text     "httpd_configuration"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blueprint_commits", force: true do |t|
    t.integer "blueprint_version_id"
  end

  create_table "blueprint_modules", force: true do |t|
    t.integer  "blueprint_version_id"
    t.integer  "module_type_id"
    t.string   "os_package"
    t.string   "module_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blueprint_versions", force: true do |t|
    t.string   "name"
    t.integer  "major"
    t.integer  "minor"
    t.integer  "release_level"
    t.integer  "patch"
    t.integer  "software_version_id"
    t.integer  "blocking_worker_id"
    t.integer  "required_memory"
    t.integer  "recommended_memory"
    t.integer  "http_protocol",                default: 0
    t.integer  "framework_port_overide"
    t.text     "custom_start_script"
    t.text     "custom_install_script"
    t.text     "custom_post_install_script"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "database_seed_file"
    t.boolean  "continuous_deployment",        default: false
    t.text     "installation_report_template"
    t.string   "first_run_url"
    t.string   "web_root_directory"
    t.text     "readme"
  end

  create_table "component_sources", force: true do |t|
    t.string   "url"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "configurators", force: true do |t|
    t.integer "service_definition_id"
    t.string  "name"
    t.string  "label"
    t.text    "description"
    t.boolean "no_save"
  end

  create_table "consumers", force: true do |t|
    t.integer "service_definition_id"
  end

  create_table "custom_php_inis", force: true do |t|
    t.text     "content"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deployment_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "external_repositories", force: true do |t|
    t.integer "blueprint_version_id"
    t.string  "repository"
  end

  create_table "file_write_permissions", force: true do |t|
    t.string   "path"
    t.boolean  "recursive",            default: false
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "framework_modules", force: true do |t|
    t.integer  "framework_id"
    t.integer  "module_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frameworks", force: true do |t|
    t.string   "name"
    t.integer  "language_id"
    t.boolean  "service_configurations",      default: true
    t.boolean  "persistent_directories",      default: true
    t.boolean  "replacement_strings",         default: true
    t.boolean  "persistent_files",            default: true
    t.boolean  "installed_packages",          default: true
    t.boolean  "system_packages",             default: true
    t.boolean  "ports",                       default: true
    t.boolean  "workers",                     default: true
    t.boolean  "rake_tasks",                  default: false
    t.boolean  "template_files",              default: true
    t.boolean  "file_write_permissions",      default: true
    t.boolean  "custom_php_inis",             default: false
    t.boolean  "apache_htaccess_files",       default: false
    t.boolean  "variables",                   default: true
    t.boolean  "component_sources",           default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "apache_httpd_configurations", default: true
    t.boolean  "continuous_deployment",       default: false
    t.boolean  "database_seed_file",          default: true
    t.boolean  "external_repositories",       default: false
  end

  create_table "installed_packages", force: true do |t|
    t.string   "name"
    t.string   "source_url"
    t.string   "destination"
    t.string   "extraction_command"
    t.string   "path_to_extracted"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses", force: true do |t|
    t.string   "name"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "module_types", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "persistent_directories", force: true do |t|
    t.string   "path"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "persistent_files", force: true do |t|
    t.string   "path"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ports", force: true do |t|
    t.integer  "port"
    t.integer  "blueprint_version_id"
    t.integer  "external"
    t.integer  "protocol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", force: true do |t|
    t.string   "name"
    t.string   "namespace"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rake_tasks", force: true do |t|
    t.string   "action"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "always_run"
  end

  create_table "replacement_strings", force: true do |t|
    t.string   "replacement_string"
    t.string   "file"
    t.string   "destination"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_configuration_variables", force: true do |t|
    t.integer  "service_configuration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_configurations", force: true do |t|
    t.string   "service_definition_id"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service_definition_type_path"
    t.string   "service_definition_publisher_namespace"
  end

  create_table "service_definition_commits", force: true do |t|
    t.integer "service_definition_id"
  end

  create_table "service_definitions", force: true do |t|
    t.integer  "service_type_id"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "description"
    t.integer  "major",                   default: 0
    t.integer  "minor",                   default: 0
    t.integer  "release_level",           default: 0
    t.integer  "patch",                   default: 0
    t.string   "service_container"
    t.string   "service_handle_field"
    t.boolean  "dedicated"
    t.boolean  "persistant"
    t.boolean  "immutable"
    t.boolean  "attach_post_build"
    t.boolean  "attach_requires_restart"
    t.boolean  "accepts_managed_engine"
    t.boolean  "accepts_managed_service"
    t.text     "readme"
  end

  create_table "service_types", force: true do |t|
    t.string   "name"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "setups", force: true do |t|
    t.integer "service_definition_id"
  end

  create_table "software_versions", force: true do |t|
    t.string   "version"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "softwares", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "home_page_url"
    t.string   "support_page_url"
    t.text     "about"
  end

  create_table "system_packages", force: true do |t|
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "package"
  end

  create_table "template_files", force: true do |t|
    t.string   "title"
    t.string   "path"
    t.text     "content"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "user_type"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "variables", force: true do |t|
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
    t.boolean  "mandatory",              default: false
    t.boolean  "ask_at_build_time",      default: false
    t.boolean  "build_time_only",        default: false
    t.boolean  "immutable",              default: false
    t.boolean  "deprecated",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "worker_ports", force: true do |t|
    t.string   "command"
    t.integer  "worker_id"
    t.integer  "port_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workers", force: true do |t|
    t.string   "name"
    t.string   "command"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
