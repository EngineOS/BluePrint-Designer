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

ActiveRecord::Schema.define(version: 20141208025952) do

  create_table "apache_custom_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apache_custom_site_files", force: true do |t|
    t.string   "name"
    t.text     "site_conf_content"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apache_custom_site_files", ["software_id"], name: "index_apache_custom_site_files_on_software_id", using: :btree

  create_table "apache_htaccess_files", force: true do |t|
    t.string   "directory"
    t.text     "htaccess_content"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apache_htaccess_files", ["software_id"], name: "index_apache_htaccess_files_on_software_id", using: :btree

  create_table "apache_httpd_conf_files", force: true do |t|
    t.string   "name"
    t.text     "httpd_conf_content"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apache_httpd_conf_files", ["software_id"], name: "index_apache_httpd_conf_files_on_software_id", using: :btree

  create_table "apache_moduals", force: true do |t|
    t.string   "modual"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apache_moduals", ["software_id"], name: "index_apache_moduals_on_software_id", using: :btree

  create_table "apache_modules", force: true do |t|
    t.string   "module"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apache_modules", ["software_id"], name: "index_apache_modules_on_software_id", using: :btree

  create_table "blocking_workers", force: true do |t|
    t.string   "command"
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "software_id"
  end

  add_index "blocking_workers", ["software_id"], name: "index_blocking_workers_on_software_id", using: :btree

  create_table "cron_jobs", force: true do |t|
    t.string   "cronjob"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "software_id"
  end

  add_index "cron_jobs", ["software_id"], name: "index_cron_jobs_on_software_id", using: :btree

  create_table "custom_php_inis", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "environment_variables", force: true do |t|
    t.text     "name"
    t.string   "value"
    t.string   "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "build_time_only",   default: false
    t.boolean  "mandatory",         default: false
    t.string   "label"
    t.boolean  "ask_at_build_time", default: false
  end

  add_index "environment_variables", ["software_id"], name: "index_environment_variables_on_software_id", using: :btree

  create_table "file_write_permissions", force: true do |t|
    t.string   "title"
    t.string   "path"
    t.boolean  "recursive"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "file_write_permissions", ["software_id"], name: "index_file_write_permissions_on_software_id", using: :btree

  create_table "generates", force: true do |t|
    t.string   "model"
    t.string   "cronjob"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "installedpackages", force: true do |t|
    t.string   "name"
    t.string   "src"
    t.string   "dest"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "extractcmd"
    t.string   "extractdir"
  end

  add_index "installedpackages", ["software_id"], name: "index_installedpackages_on_software_id", using: :btree

  create_table "langauges", force: true do |t|
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "langframeworks", force: true do |t|
    t.string   "name"
    t.text     "comment"
    t.integer  "langauge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "langframeworks", ["langauge_id"], name: "index_langframeworks_on_langauge_id", using: :btree

  create_table "licenses", force: true do |t|
    t.string   "name"
    t.string   "sourceurl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
  end

  create_table "ospackages", force: true do |t|
    t.string   "name"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ospackages", ["software_id"], name: "index_ospackages_on_software_id", using: :btree

  create_table "owners", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "persistantdirs", force: true do |t|
    t.string   "path"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "persistantdirs", ["software_id"], name: "index_persistantdirs_on_software_id", using: :btree

  create_table "persistantfiles", force: true do |t|
    t.string   "path"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "persistantfiles", ["software_id"], name: "index_persistantfiles_on_software_id", using: :btree

  create_table "published_softwares", force: true do |t|
    t.string   "short_name"
    t.string   "full_name"
    t.text     "description"
    t.string   "home_page"
    t.string   "image_url"
    t.string   "repository"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "software_id"
  end

  create_table "rake_tasks", force: true do |t|
    t.string   "name"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "software_id"
  end

  add_index "rake_tasks", ["software_id"], name: "index_rake_tasks_on_software_id", using: :btree

  create_table "replacementstrings", force: true do |t|
    t.string   "sedstr"
    t.string   "file"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dest"
  end

  add_index "replacementstrings", ["software_id"], name: "index_replacementstrings_on_software_id", using: :btree

  create_table "service_environment_variables", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.text     "comment"
    t.boolean  "ask_at_runtime"
    t.integer  "softwareservice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_type_environment_variables", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.text     "comment"
    t.integer  "servicetype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "build_time_only",   default: false
    t.boolean  "mandatory"
    t.boolean  "ask_at_build_time"
  end

  add_index "service_type_environment_variables", ["servicetype_id"], name: "index_service_type_environment_variables_on_servicetype_id", using: :btree

  create_table "servicetypes", force: true do |t|
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "softwaredeploytypes", force: true do |t|
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "softwares", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
    t.boolean  "mysql"
    t.boolean  "pgsql"
    t.boolean  "filesystem"
    t.boolean  "deployed"
    t.string   "version"
    t.integer  "langauge_id"
    t.integer  "license_id"
    t.integer  "owner_id"
    t.integer  "swframework_id"
    t.integer  "softwaredeploytype_id"
    t.integer  "requiredmemory"
    t.string   "toconfigurefile"
    t.string   "configuredfile"
    t.integer  "work_port_id"
    t.integer  "worker_command_id"
    t.integer  "blocking_worker_id"
    t.string   "icon_url"
    t.integer  "rake_task_id"
    t.text     "custom_start_script"
    t.text     "custom_install_script"
    t.text     "custom_post_install_script"
    t.integer  "http_protocol",              default: 1
  end

  create_table "softwareservices", force: true do |t|
    t.string   "name"
    t.text     "comment"
    t.integer  "servicetype_id"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dest"
  end

  add_index "softwareservices", ["servicetype_id"], name: "index_softwareservices_on_servicetype_id", using: :btree
  add_index "softwareservices", ["software_id"], name: "index_softwareservices_on_software_id", using: :btree

  create_table "swframeworks", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "langauge_id"
  end

  create_table "template_files", force: true do |t|
    t.string   "title"
    t.string   "path"
    t.text     "content"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "template_files", ["software_id"], name: "index_template_files_on_software_id", using: :btree

  create_table "work_ports", force: true do |t|
    t.integer  "port"
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "software_id"
    t.integer  "external"
    t.integer  "protocol",    default: 1
  end

  add_index "work_ports", ["software_id"], name: "index_work_ports_on_software_id", using: :btree

  create_table "worker_commands", force: true do |t|
    t.string   "command"
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "software_id"
  end

  add_index "worker_commands", ["software_id"], name: "index_worker_commands_on_software_id", using: :btree

end
