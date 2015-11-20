class ServiceConfigurationsHoldServiceDefinitionTypePathAndPublisherNamespace < ActiveRecord::Migration
  def change
    add_column :service_configurations, :service_definition_type_path, :string
    add_column :service_configurations, :service_definition_publisher_namespace, :string
  end
end
