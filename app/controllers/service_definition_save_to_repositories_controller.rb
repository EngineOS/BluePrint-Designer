class ServiceDefinitionSaveToRepositoriesController < ApplicationController

  def show
    @service_definition = ServiceDefinition.find(params[:id])
    if @service_definition.save_to_repository
      flash[:notice] = "Service definition saved."
      redirect_to service_definition_path params[:id]
    else
      flash[:alert] = "Failed to save."
      redirect_to service_definition_path params[:id]
    end
  end

end
