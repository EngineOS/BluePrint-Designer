class AddMemorytoSoftware < ActiveRecord::Migration
  def change
	add_column :softwares, :requiredmemoery, :integer
  end
end
