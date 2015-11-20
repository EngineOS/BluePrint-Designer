class FixTypoInBlueprintContinuousDeploymentColName < ActiveRecord::Migration
  def change
    rename_column :blueprint_versions, :continuos_deployment, :continuous_deployment
    rename_column :frameworks, :continuos_deployment, :continuous_deployment
  end
end
