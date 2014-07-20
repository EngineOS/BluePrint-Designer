class AddSoftwareIndextoWorkers < ActiveRecord::Migration
  def change
	add_column :worker_commands, :software_id,:integer
 add_index :worker_commands,:software_id

add_column :work_ports, :software_id,:integer
 add_index :work_ports,:software_id

add_column :blocking_workers, :software_id,:integer
 add_index :blocking_workers,:software_id
  end
end
