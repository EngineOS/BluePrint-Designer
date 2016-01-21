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
    # BlueprintVersion.all.each do |blueprint_version|
    #   if service_configuration.service_definition.present? && service_configuration.service_definition.publisher.present? && service_configuration.service_definition.service_type.present?
    #     publisher_namespace = service_configuration.service_definition.publisher.namespace
    #     type_path = service_configuration.service_definition.service_type.path
    #     service_configuration.service_definition_path = publisher_namespace + '/' + type_path
    #     service_configuration.save
    #   end
    # end


    redirect_to welcome_path, notice: 'Upgrade script has run.'
  end

# software_publisher:string full_title:string short_title:string description:text icon_url:string language_id:integer license_id:integer framework_id:integer deployment_type_id:integer component_path:string extract_components:boolean home_page_url:string support_page_url:string about:text


end
