class AddDatabaseSeedToBlueprintVersions < ActiveRecord::Migration
  def change
    add_column :blueprint_versions, :database_seed_file, :text
    add_column :blueprint_versions, :continuos_deployment, :boolean, default: false
    add_column :frameworks, :continuos_deployment, :boolean, default: false
    add_column :frameworks, :database_seed_file, :boolean, default: true
  end
end
