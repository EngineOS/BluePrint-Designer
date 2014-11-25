class AddProtocolToWorkPort < ActiveRecord::Migration
  def change
    add_column :work_ports, :protocol, :integer, default: 1
  end
end
