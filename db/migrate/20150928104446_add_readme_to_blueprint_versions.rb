class AddReadmeToBlueprintVersions < ActiveRecord::Migration
  def change
    add_column :blueprint_versions, :readme, :text
  end
end
