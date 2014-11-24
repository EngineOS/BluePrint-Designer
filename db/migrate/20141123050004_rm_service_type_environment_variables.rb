class RmServiceTypeEnvironmentVariables < ActiveRecord::Migration
  def change
    drop_table :service_type_environment_variables
  end
end
