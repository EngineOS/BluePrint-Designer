class AddrakeTasksToSoftware < ActiveRecord::Migration
  def change
    add_reference :softwares,  :rake_task
  end
end
