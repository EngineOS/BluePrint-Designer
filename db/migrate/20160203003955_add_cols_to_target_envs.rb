class AddColsToTargetEnvs < ActiveRecord::Migration
  def change
    add_column :target_envs, :variable_name, :string
    add_column :target_envs, :environment_name, :string
  end
end
