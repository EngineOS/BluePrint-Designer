class AddBuildtimeOnlyToServiceTypeEnvironmentVariables < ActiveRecord::Migration
  def change
    add_column :service_type_environment_variables, :build_time_only, :boolean, :default => false
  end
end
