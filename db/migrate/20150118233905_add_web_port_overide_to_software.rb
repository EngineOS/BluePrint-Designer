class AddWebPortOverideToSoftware < ActiveRecord::Migration
  def change
	add_column :softwares, :web_port_overide, :integer
  end
end
