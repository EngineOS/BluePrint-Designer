class ServiceDefinitionYamlsController < ApplicationController

  def show
    @service_definition = ServiceDefinition.find(params[:id])
  end

end
