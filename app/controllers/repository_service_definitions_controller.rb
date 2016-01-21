class RepositoryServiceDefinitionsController < ApplicationController

  def show
    @repository_service_definition = ::Repository::ServiceDefinition::Load.new(params[:id].gsub('\\', '/')).service_definition
  end

end
