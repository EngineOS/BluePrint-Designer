class ServiceDefinitionsController < ApplicationController

  def new
    @service_definition = ServiceDefinition.new
    # @service_definition.configurators.build.variables.build
    # @service_definition.build_consumer.variables.build
    # @service_definition.build_setup.variables.build
  end

  def create
    @service_definition = ServiceDefinition.new(service_definition_params)
    if @service_definition.save
      redirect_to @service_definition
    else
      render 'new'
    end
  end

  def show
    @service_definition = ServiceDefinition.find(params[:id])
  end

  def index
    @service_definitions = ServiceDefinition.all
  end

  def edit
    @service_definition = ServiceDefinition.find(params[:id])
  end


  def update
    @service_definition = ServiceDefinition.find(params[:id])
    if @service_definition.update(service_definition_params)
      redirect_to @service_definition
    else
      render 'edit'
    end
  end

  def destroy
    @service_definition = ServiceDefinition.find(params[:id])
    @service_definition.destroy
    redirect_to service_path(@service_definition.service)
  end

private

  def service_definition_params
    params.require(:service_definition).permit! #(:name, :comment)
  end

end
