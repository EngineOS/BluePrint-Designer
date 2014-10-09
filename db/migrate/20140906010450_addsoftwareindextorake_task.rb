class AddsoftwareindextorakeTask < ActiveRecord::Migration
  def change
    add_column :rake_tasks, :software_id,:integer
     add_index :rake_tasks,:software_id
  end
end
