class ServiceConfigurationVariablesController < ApplicationController

  def new
    @service_configuration_variable = ServiceConfigurationVariable.new(params[:service_configuration_id] )
  end

  def create
    @service_configuration_variable = ServiceConfigurationVariable.new(service_configuration_variable_params)
    if @service_configuration_variable.save
      redirect_to @service_configuration_variable
    else
      render 'new'
    end
  end

  def show
    @service_configuration_variable = ServiceConfigurationVariable.find(params[:id])
  end

# def index
#   # ServiceConfigurationVariable.destroy_all
#   @service_configuration_variables = ServiceConfigurationVariable.all
# end

  def edit
    @service_configuration_variable = ServiceConfigurationVariable.find(params[:id])
  end

  def update
    @service_configuration_variable = ServiceConfigurationVariable.find(params[:id])
# render text: @service_configuration_variable.variable.to_label
    if @service_configuration_variable.update(service_configuration_variable_params)
      redirect_to @service_configuration_variable
    else
      render 'edit'
    end
  end

  def destroy
    @service_configuration_variable = ServiceConfigurationVariable.find(params[:id])
    @service_configuration_variable.destroy
    redirect_to (@service_configuration_variable.variable_consumer_type).camelize.constantize.find(@service_configuration_variable.variable_consumer_id)
  end

private

  def service_configuration_variable_params
    params.require(:service_configuration_variable).permit!
  end

end
