class InstalledPackagesController < ApplicationController

  def new
    @installed_package = InstalledPackage.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @installed_package = InstalledPackage.new(installed_package_params)
    if @installed_package.save
      redirect_to @installed_package
    else
      render 'new'
    end
  end

  def show
    @installed_package = InstalledPackage.find(params[:id])
  end

  def edit
    @installed_package = InstalledPackage.find(params[:id])
  end

  def update
    @installed_package = InstalledPackage.find(params[:id])

    if @installed_package.update(installed_package_params)
      redirect_to @installed_package
    else
      render 'edit'
    end
  end

  def destroy
    @installed_package = InstalledPackage.find(params[:id])
    @installed_package.destroy
    redirect_to @installed_package.blueprint_version
  end

private

  def installed_package_params
    params.require(:installed_package).permit!
  end

end
