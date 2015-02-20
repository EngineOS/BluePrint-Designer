class ComponentSourcesController < ApplicationController

  def new
    @component_source = ComponentSource.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @component_source = ComponentSource.new(component_source_params)
    if @component_source.save
      redirect_to @component_source
    else
      render 'new'
    end
  end

  def show
    @component_source = ComponentSource.find(params[:id])
  end

  def edit
    @component_source = ComponentSource.find(params[:id])
  end

  def update
    @component_source = ComponentSource.find(params[:id])

    if @component_source.update(component_source_params)
      redirect_to @component_source
    else
      render 'edit'
    end
  end

  def destroy
    @component_source = ComponentSource.find(params[:id])
    @component_source.destroy
    redirect_to @component_source.blueprint_version
  end

private

  def component_source_params
    params.require(:component_source).permit!
  end

end
