class DeploymentTypesController < ApplicationController

  def new
    @deployment_type = DeploymentType.new
  end

  def create
    @deployment_type = DeploymentType.new(deployment_type_params)
    if @deployment_type.save
      redirect_to @deployment_type
    else
      render 'new'
    end
  end

  def show
    @deployment_type = DeploymentType.find(params[:id])
  end

  def index
    @deployment_types = DeploymentType.all
  end

  def edit
    @deployment_type = DeploymentType.find(params[:id])
  end


  def update
    @deployment_type = DeploymentType.find(params[:id])
    if @deployment_type.update(deployment_type_params)
      redirect_to @deployment_type
    else
      render 'edit'
    end
  end

  def destroy
    @deployment_type = DeploymentType.find(params[:id])
    @deployment_type.destroy
    redirect_to deployment_types_path
  end

private

  def deployment_type_params
    params.require(:deployment_type).permit! #(:name, :comment)
  end

end
