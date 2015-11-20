class ServiceVersionsController < ApplicationController

  def new
    @service_version = ServiceVersion.new(service_id: params[:service_id])
    # @service_version.variables.build
  end

  def create
    @service_version = ServiceVersion.new(service_version_params)
    if @service_version.save
      redirect_to @service_version
    else
      render 'new'
    end
  end

  def show
    @service_version = ServiceVersion.find(params[:id])
  end

  def index
    @service_versions = ServiceVersion.all
  end

  def edit
    @service_version = ServiceVersion.find(params[:id])
  end


  def update
    @service_version = ServiceVersion.find(params[:id])
    if @service_version.update(service_version_params)
      redirect_to @service_version
    else
      render 'edit'
    end
  end

  def destroy
    @service_version = ServiceVersion.find(params[:id])
    @service_version.destroy
    redirect_to services_path(@service_version.service)
  end

private

  def service_version_params
    params.require(:service_version).permit! #(:name, :comment)
  end

end
