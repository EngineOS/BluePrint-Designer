class AddServiceDefinitionPathToServiceConfigurations  < ActiveRecord::Migration
  def change
    add_column :service_configurations, :service_definition_path, :string
  end
end
