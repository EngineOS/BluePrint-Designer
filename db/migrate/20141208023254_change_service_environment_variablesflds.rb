class ChangeServiceEnvironmentVariablesflds < ActiveRecord::Migration
  def change
    change_column :environment_variables, :mandatory, :boolean     
    change_column :environment_variables,:ask_at_build_time,:boolean
    change_column :environment_variables,:build_time_only,:boolean
    change_column :service_type_environment_variables,:build_time_only,:boolean
    change_column :service_type_environment_variables, :mandatory, :boolean
    change_column :service_type_environment_variables,:ask_at_build_time,:boolean
  end
end
