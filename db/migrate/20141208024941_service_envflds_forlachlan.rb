class ServiceEnvfldsForlachlan < ActiveRecord::Migration
  def change
    #add_column :environment_variables, :label, :string
      remove_column :service_type_environment_variables, :ask_at_buildtime
      add_column :service_type_environment_variables,:ask_at_build_time,:boolean
  end
end
