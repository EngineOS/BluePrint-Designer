class SystemPackagesController < ApplicationController

  def new
    @system_packages = SystemPackage.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @system_packages = SystemPackage.new(system_packages_params)
    if @system_packages.save
      redirect_to @system_packages
    else
      render 'new'
    end
  end

  def show
    @system_packages = SystemPackage.find(params[:id])
  end

  def edit
    @system_packages = SystemPackage.find(params[:id])
  end

  def update
    @system_packages = SystemPackage.find(params[:id])

    if @system_packages.update(system_packages_params)
      redirect_to @system_packages
    else
      render 'edit'
    end
  end

  def destroy
    @system_packages = SystemPackage.find(params[:id])
    @system_packages.destroy
    redirect_to @system_packages.blueprint_version
  end

private

  def system_packages_params
    params.require(:system_packages).permit!
  end

end
