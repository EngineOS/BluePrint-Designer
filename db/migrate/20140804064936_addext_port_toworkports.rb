class AddextPortToworkports < ActiveRecord::Migration
  def change
	add_column :work_ports, :external, :integer
  end
end
