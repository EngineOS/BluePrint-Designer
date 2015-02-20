class ServiceBlueprintsController < ApplicationController

  def new
    @service_blueprint = ServiceBlueprint.new
    @service_blueprint.variables.build
  end

  def create
    @service_blueprint = ServiceBlueprint.new(service_blueprint_params)
    if @service_blueprint.save
      redirect_to @service_blueprint
    else
      render 'new'
    end
  end

  def show
    @service_blueprint = ServiceBlueprint.find(params[:id])
  end

  def index
    @service_blueprints = ServiceBlueprint.all
  end

  def edit
    @service_blueprint = ServiceBlueprint.find(params[:id])
  end


  def update
    @service_blueprint = ServiceBlueprint.find(params[:id])
    if @service_blueprint.update(service_blueprint_params)
      redirect_to @service_blueprint
    else
      render 'edit'
    end
  end

  def destroy
    @service_blueprint = ServiceBlueprint.find(params[:id])
    @service_blueprint.destroy
    redirect_to service_blueprints_path
  end

private

  def service_blueprint_params
    params.require(:service_blueprint).permit! #(:name, :comment)
  end

end
