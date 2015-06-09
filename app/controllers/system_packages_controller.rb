class SystemPackagesController < ApplicationController

  def new
    @system_package = SystemPackage.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @system_package = SystemPackage.new(system_package_params)
    if @system_package.save
      redirect_to ( url_for( @system_package.blueprint_version ) + '#' + @system_package.class.name.underscore + '_' + @system_package.id.to_s )
    else
      render 'new'
    end
  end

  # def show
  #   @system_package = SystemPackage.find(params[:id])
  # end

  def edit
    @system_package = SystemPackage.find(params[:id])
  end

  def update
    @system_package = SystemPackage.find(params[:id])

    if @system_package.update(system_package_params)
      redirect_to ( url_for( @system_package.blueprint_version ) + '#' + @system_package.class.name.underscore + '_' + @system_package.id.to_s )
    else
      render 'edit'
    end
  end

  def destroy
    @system_package = SystemPackage.find(params[:id])
    @system_package.destroy
      redirect_to ( url_for( @system_package.blueprint_version ) + '#' + @system_package.class.name.pluralize.underscore )
  end

private

  def system_package_params
    params.require(:system_package).permit!
  end

end
