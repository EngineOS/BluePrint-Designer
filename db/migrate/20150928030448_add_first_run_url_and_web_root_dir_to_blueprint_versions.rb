class AddFirstRunUrlAndWebRootDirToBlueprintVersions < ActiveRecord::Migration
  def change
    add_column :blueprint_versions, :first_run_url, :string
    add_column :blueprint_versions, :web_root_directory, :string
  end
end
