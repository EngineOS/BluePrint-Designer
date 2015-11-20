class ServiceDefinitionHumanizersController < ApplicationController

  def show
    @service_definition = ServiceDefinition.find(params[:id])
  end    

private

  def service_definition_params
    params.require(:service_definition).permit!
  end

end