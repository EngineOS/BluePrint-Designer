class AddTopLevelDirectoryToBlueprintVersion < ActiveRecord::Migration
  def change
    add_column :blueprint_versions, :top_level_directory, :string, default: '/'
  end
end
