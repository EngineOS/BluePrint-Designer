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

ActiveRecord::Schema.define(version: 20140712101419) do

  create_table "cron_jobs", force: true do |t|
    t.string   "cronjob"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "software_id"
  end

  add_index "cron_jobs", ["software_id"], name: "index_cron_jobs_on_software_id"

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

  add_index "installedpackages", ["software_id"], name: "index_installedpackages_on_software_id"

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

  add_index "langframeworks", ["langauge_id"], name: "index_langframeworks_on_langauge_id"

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

  add_index "ospackages", ["software_id"], name: "index_ospackages_on_software_id"

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

  add_index "persistantdirs", ["software_id"], name: "index_persistantdirs_on_software_id"

  create_table "persistantfiles", force: true do |t|
    t.string   "path"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "persistantfiles", ["software_id"], name: "index_persistantfiles_on_software_id"

  create_table "replacementstrings", force: true do |t|
    t.string   "sedstr"
    t.string   "file"
    t.text     "comment"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dest"
  end

  add_index "replacementstrings", ["software_id"], name: "index_replacementstrings_on_software_id"

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
    t.integer  "cronjob_id"
  end

  create_table "softwareservices", force: true do |t|
    t.string   "name"
    t.text     "comment"
    t.integer  "servicetype_id"
    t.integer  "software_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "softwareservices", ["servicetype_id"], name: "index_softwareservices_on_servicetype_id"
  add_index "softwareservices", ["software_id"], name: "index_softwareservices_on_software_id"

  create_table "swframeworks", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "langauge_id"
  end

end
