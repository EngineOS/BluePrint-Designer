class UpgradesController < ApplicationController

 def show
    ServiceConfiguration.all.each do |service_configuration|
      if service_configuration.service_definition.present? && service_configuration.service_definition.publisher.present? && service_configuration.service_definition.service_type.present?
        publisher_namespace = service_configuration.service_definition.publisher.namespace
        type_path = service_configuration.service_definition.service_type.path
        service_configuration.service_definition_path = publisher_namespace + '/' + type_path
        service_configuration.save
      end
    end
    redirect_to welcome_path, notice: 'Upgrade script has run.'
  end

end
