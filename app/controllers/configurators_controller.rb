class ConfiguratorsController < ApplicationController

  def new
    @configurator = Configurator.new(service_definition_id: params[:service_definition_id])
    # @configurator.variables.build
  end

  def create
    @configurator = Configurator.new(configurator_params)
    if @configurator.save
      redirect_to @configurator
    else
      render 'new'
    end
  end

  def show
    @configurator = Configurator.find(params[:id])
  end

  def index
    @configurators = Configurator.all
  end

  def edit
    @configurator = Configurator.find(params[:id])
  end


  def update
    @configurator = Configurator.find(params[:id])
    if @configurator.update(configurator_params)
      redirect_to @configurator
    else
      render 'edit'
    end
  end

  def destroy
    @configurator = Configurator.find(params[:id])
    @configurator.destroy
    redirect_to url_for(@actionator.service_definition) + '#actionators'
  end

private

  def configurator_params
    params.require(:configurator).permit! #(:name, :comment)
  end

end
