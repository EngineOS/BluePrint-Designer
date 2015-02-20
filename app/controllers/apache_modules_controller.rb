class ApacheModulesController < ApplicationController

  def new
    @apache_module = ApacheModule.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @apache_module = ApacheModule.new(apache_module_params)
    if @apache_module.save
      redirect_to @apache_module
    else
      render 'new'
    end
  end

  def show
    @apache_module = ApacheModule.find(params[:id])
  end

  def edit
    @apache_module = ApacheModule.find(params[:id])
  end

  def update
    @apache_module = ApacheModule.find(params[:id])

    if @apache_module.update(apache_module_params)
      redirect_to @apache_module
    else
      render 'edit'
    end
  end

  def destroy
    @apache_module = ApacheModule.find(params[:id])
    @apache_module.destroy
    redirect_to @apache_module.blueprint_version
  end

private

  def apache_module_params
    params.require(:apache_module).permit!
  end

end
