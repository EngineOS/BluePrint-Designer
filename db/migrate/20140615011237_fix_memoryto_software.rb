class FixMemorytoSoftware < ActiveRecord::Migration
  def change
	rename_column :softwares, :requiredmemoery, :requiredmemory
  end
end
