class ServiceActionatorsController < ApplicationController

  def new
    @service_actionator = ServiceActionator.new(service_definition_id: params[:service_definition_id])
  end

  def create
    @service_actionator = ServiceActionator.new(service_actionator_params)
    if @service_actionator.save
      redirect_to @service_actionator
    else
      render 'new'
    end
  end

  def show
    @service_actionator = ServiceActionator.find(params[:id])
  end

  def index
    @service_actionators = ServiceActionator.all
  end

  def edit
    @service_actionator = ServiceActionator.find(params[:id])
  end


  def update
    @service_actionator = ServiceActionator.find(params[:id])
    if @service_actionator.update(service_actionator_params)
      redirect_to @service_actionator
    else
      render 'edit'
    end
  end

  def destroy
    @service_actionator = ServiceActionator.find(params[:id])
    @service_actionator.destroy
    redirect_to url_for(@service_actionator.service_definition) + '#service_actionators'
  end

private

  def service_actionator_params
    params.require(:service_actionator).permit! #(:name, :comment)
  end

end
