class AddHttpProtocolToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :http_protocol, :integer, default: 1
 
  end
end
