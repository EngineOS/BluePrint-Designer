class AddBuildtimeOnlyToEnvironmentVariables < ActiveRecord::Migration
  def change
    add_column :environment_variables, :build_time_only, :boolean, :default => false
 
  end
end
