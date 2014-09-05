class AddIconUrltoSoftware < ActiveRecord::Migration
  def change
   add_column :softwares, :icon_url, :string
  end
end
