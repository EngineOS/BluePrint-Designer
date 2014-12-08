class ChangeServiceEnvironmentVariablesflds < ActiveRecord::Migration
  def change
    add_column :service_type_environment_variables, :mandatory, :boolean
      remove_column :service_type_environment_variables, :ask_at_runtime,:ask_at_buildtime
      add_column :service_type_environment_variables,:ask_at_buildtime,:boolean
  end
end
