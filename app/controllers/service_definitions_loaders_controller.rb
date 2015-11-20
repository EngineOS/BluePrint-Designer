class ServiceDefinitionsLoadersController < ApplicationController

  def new
    # render text: ServiceVersion.find(params[:service_version_id]).build_service_definition_upload.service_version_id
    @service_definitions_loader = ServiceDefinitionsLoader.new
  end

  def create
    @service_definitions_loader = ServiceDefinitionsLoader.new(service_definitions_loader_params)
    if @service_definitions_loader.valid?
      if @service_definitions_loader.upload_all
        redirect_to service_definitions_path,
          notice: 'Successfully imported service definitions.'
      else
        redirect_to service_definitions_path,
          alert: 'Unable to import service definition.'
      end
    else
      render :new
    end
  end
  
private

  def service_definitions_loader_params
    params.require(:service_definitions_loader).permit! #(:name, :comment)
  end

end