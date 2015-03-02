class CreateServiceConfigurationVariables < ActiveRecord::Migration
  def change
    create_table :service_configuration_variables do |t|
      t.integer    "service_configuration_id"
      t.timestamps
    end
  end
end
