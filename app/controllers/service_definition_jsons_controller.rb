class ServiceDefinitionJsonsController < ApplicationController

  def show
    @service_definition = ServiceDefinition.find(params[:id])
    # render json: @service_definition
  end

private

  def service_definition_params
    params.require(:service_definition).permit!
  end

end
