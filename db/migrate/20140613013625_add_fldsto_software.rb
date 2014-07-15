class AddFldstoSoftware < ActiveRecord::Migration
  def change
	add_column :softwares, :source, :string
	add_column :softwares, :mysql, :boolean
	add_column :softwares, :pgsql, :boolean
	add_column :softwares, :filesystem, :boolean
 	add_column :softwares, :deployed, :boolean
	add_column :softwares, :version, :string

	
	

  end
end
