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

ActiveRecord::Schema.define(version: 20150206032537) do

  create_table "apache_custom_site_files", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.text     "site_configuration"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apache_htaccess_files", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "directory"
    t.text     "htaccess_content"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apache_httpd_conf_files", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.text     "httpd_configuration"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apache_modules", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "os_package"
    t.string   "module"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blueprint_versions", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "component_directories", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "destination_path"
    t.boolean  "extract"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "component_sources", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "url"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custom_php_inis", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.text     "content"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deployment_types", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_write_permissions", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "path"
    t.boolean  "recursive",            default: false
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "frameworks", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.integer  "language_id"
    t.boolean  "service_configurations"
    t.boolean  "persistent_directories"
    t.boolean  "replacement_strings"
    t.boolean  "persistent_files"
    t.boolean  "installed_packages"
    t.boolean  "system_packages"
    t.boolean  "workers"
    t.boolean  "rake_tasks"
    t.boolean  "template_files"
    t.boolean  "file_write_permissions"
    t.boolean  "custom_php_inis"
    t.boolean  "apache_htaccess_files"
    t.boolean  "apache_modules"
    t.boolean  "variables"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "installed_packages", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "source_url"
    t.string   "destination"
    t.string   "extraction_command"
    t.string   "extraction_directory"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "persistent_directories", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "path"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "persistent_files", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "path"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ports", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.integer  "port"
    t.integer  "blueprint_version_id"
    t.integer  "external"
    t.integer  "protocol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "namespace"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rake_tasks", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "action"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "replacement_strings", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "sedstr"
    t.string   "file"
    t.string   "dest"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_blueprints", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.integer  "service_type_id"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_configurations", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.text     "service_definition"
    t.string   "service_blueprint_id"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_types", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "software_versions", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "title"
    t.string   "display_name"
    t.text     "description"
    t.string   "icon_url"
    t.integer  "software_id"
    t.integer  "language_id"
    t.integer  "license_id"
    t.integer  "framework_id"
    t.integer  "deployment_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "softwares", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.integer  "publisher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "system_packages", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "template_files", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
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
    t.string   "record_name"
    t.string   "record_comment"
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
    t.boolean  "lookup_system_values",   default: false
    t.boolean  "deprecated",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "worker_ports", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "command"
    t.integer  "worker_id"
    t.integer  "port_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workers", force: true do |t|
    t.string   "record_name"
    t.string   "record_comment"
    t.string   "name"
    t.string   "command"
    t.integer  "blueprint_version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
