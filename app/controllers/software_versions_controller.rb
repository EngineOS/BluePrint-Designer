class SoftwareVersionsController < ApplicationController

  def new
    @software_version = SoftwareVersion.new(software_id: params[:software_id])
  end

  def create
    @software_version = SoftwareVersion.new(software_version_params)
    if @software_version.save
      redirect_to @software_version
    else
      render 'new'
    end
  end

  def show
    @software_version = SoftwareVersion.find(params[:id])
  end

  # def index
  #   @software_versions = SoftwareVersion.all
  # end

  def edit
    @software_version = SoftwareVersion.find(params[:id])
  end

  def update
    @software_version = SoftwareVersion.find(params[:id])

    if @software_version.update(software_version_params)
      redirect_to @software_version
    else
      render 'edit'
    end
  end

  def destroy
    @software_version = SoftwareVersion.find(params[:id])
    @software_version.destroy
    redirect_to software_path(@software_version.software)
  end

private

  def software_version_params
    params.require(:software_version).permit!
  end

end
