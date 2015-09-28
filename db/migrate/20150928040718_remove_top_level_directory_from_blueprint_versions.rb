class RemoveTopLevelDirectoryFromBlueprintVersions < ActiveRecord::Migration
  def change
    remove_column :blueprint_versions, :top_level_directory
  end
end
