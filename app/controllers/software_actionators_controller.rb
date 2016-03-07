class SoftwareActionatorsController < ApplicationController

  def new
    @software_actionator = SoftwareActionator.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @software_actionator = SoftwareActionator.new(software_actionator_params)
    if @software_actionator.save
      redirect_to @software_actionator
    else
      render 'new'
    end
  end

  def show
    @software_actionator = SoftwareActionator.find(params[:id])
  end

  def index
    @software_actionators = SoftwareActionator.all
  end

  def edit
    @software_actionator = SoftwareActionator.find(params[:id])
  end


  def update
    @software_actionator = SoftwareActionator.find(params[:id])
    if @software_actionator.update(software_actionator_params)
      redirect_to @software_actionator
    else
      render 'edit'
    end
  end

  def destroy
    @software_actionator = SoftwareActionator.find(params[:id])
    @software_actionator.destroy
    redirect_to url_for(@software_actionator.blueprint_version) + '#software_actionators'
  end

private

  def software_actionator_params
    params.require(:software_actionator).permit! #(:name, :comment)
  end

end
