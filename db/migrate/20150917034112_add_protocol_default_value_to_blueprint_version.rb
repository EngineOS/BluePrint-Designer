class AddProtocolDefaultValueToBlueprintVersion < ActiveRecord::Migration
  def change
    change_column :blueprint_versions, :http_protocol, :integer, default: 0
  end
end
