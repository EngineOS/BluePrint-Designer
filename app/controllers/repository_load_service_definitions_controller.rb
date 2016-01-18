class RepositoryLoadServiceDefinitionsController < ApplicationController

  def show
    ServiceDefinition.destroy_all
    ServiceDefinition.create ::Repository::Repository.new.all_service_definition_attributes
    redirect_to service_definitions_path, notice: 'Service definitions have been loaded.'
  end

end
