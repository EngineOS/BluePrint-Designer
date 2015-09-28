class PearModulesController < ApplicationController

  def new
    @pear_module = PearModule.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @pear_module = PearModule.new(pear_module_params)
    if @pear_module.save
      redirect_to @pear_module
    else
      render 'new'
    end
  end

  def show
    @pear_module = PearModule.find(params[:id])
  end

  def edit
    @pear_module = PearModule.find(params[:id])
  end

  def update
    @pear_module = PearModule.find(params[:id])

    if @pear_module.update(pear_module_params)
      redirect_to @pear_module
    else
      render 'edit'
    end
  end

  def destroy
    @pear_module = PearModule.find(params[:id])
    @pear_module.destroy
    redirect_to @pear_module.blueprint_version
  end

private

  def pear_module_params
    params.require(:pear_module).permit!
  end

end
