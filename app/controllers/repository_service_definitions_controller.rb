class RepositoryServiceDefinitionsController < ApplicationController

  def show
    @repository_service_definition = ::Repository::ServiceDefinition::Load.new(params[:id]).service_definition
  end

end
