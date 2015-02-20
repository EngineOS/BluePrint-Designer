class ServiceTypesController < ApplicationController

  def new
    @service_type = ServiceType.new
  end

  def create
    @service_type = ServiceType.new(service_type_params)
    if @service_type.save
      redirect_to @service_type
    else
      render 'new'
    end
  end

  def show
    @service_type = ServiceType.find(params[:id])
  end

  def index
    @service_types = ServiceType.all
  end

  def edit
    @service_type = ServiceType.find(params[:id])
  end

  def update
    @service_type = ServiceType.find(params[:id])
    if @service_type.update(service_type_params)
      redirect_to @service_type
    else
      render 'edit'
    end
  end

  def destroy
    @service_type = ServiceType.find(params[:id])
    @service_type.destroy
    redirect_to service_types_path
  end

private
  def service_type_params
    params.require(:service_type).permit! #(:name, :comment)
  end

end
