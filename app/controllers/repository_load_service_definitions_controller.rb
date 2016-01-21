class RepositoryLoadServiceDefinitionsController < ApplicationController

  def show
    ServiceDefinition.destroy_all

    service_definitions = ::Repository::Repository.new.all_service_definition_attributes
    p service_definitions
    ServiceDefinition.create service_definitions
    redirect_to service_definitions_path, notice: 'Service definitions have been loaded.'
  end

end
