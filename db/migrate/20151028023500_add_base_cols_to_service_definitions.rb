class AddBaseColsToServiceDefinitions < ActiveRecord::Migration
  def change
    change_table :service_definitions do |t|
      t.string  :title
      t.text    :description
      t.integer :major, default: 0
      t.integer :minor, default: 0
      t.integer :release_level, default: 0
      t.integer :patch, default: 0
      t.string  :service_container
      t.string  :service_handle_field
      t.boolean :dedicated
      t.boolean :persistant
      t.boolean :immutable
      t.boolean :attach_post_build
      t.boolean :attach_requires_restart
      t.boolean :accepts_managed_engine
      t.boolean :accepts_managed_service
      t.text    :readme
    end
  end
end
