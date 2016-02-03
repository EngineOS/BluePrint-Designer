class RenameSetupsToTargetEnv < ActiveRecord::Migration
  def change
    rename_table :setups, :target_envs
  end
end
