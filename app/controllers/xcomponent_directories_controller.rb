class ComponentDirectoriesController < ApplicationController

  def new
    @component_directory = ComponentDirectory.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @component_directory = ComponentDirectory.new(component_directory_params)
    if @component_directory.save
      redirect_to @component_directory
    else
      render 'new'
    end
  end

  def show
    @component_directory = ComponentDirectory.find(params[:id])
  end

  def edit
    @component_directory = ComponentDirectory.find(params[:id])
  end

  def update
    @component_directory = ComponentDirectory.find(params[:id])

    if @component_directory.update(component_directory_params)
      redirect_to @component_directory
    else
      render 'edit'
    end
  end

  def destroy
    @component_directory = ComponentDirectory.find(params[:id])
    @component_directory.destroy
    redirect_to @component_directory.blueprint_version
  end

private

  def component_directory_params
    params.require(:component_directory).permit!
  end

end
