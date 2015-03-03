class AddAlwaysRunToRakeTasks < ActiveRecord::Migration
  def change
    add_column :rake_tasks, :always_run, :boolean
  end
end
