class CustomPhpInisController < ApplicationController

  def new
    @custom_php_ini = CustomPhpIni.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @custom_php_ini = CustomPhpIni.new(custom_php_ini_params)
    if @custom_php_ini.save
      redirect_to @custom_php_ini
    else
      render 'new'
    end
  end

  def show
    @custom_php_ini = CustomPhpIni.find(params[:id])
  end

  def edit
    @custom_php_ini = CustomPhpIni.find(params[:id])
  end

  def update
    @custom_php_ini = CustomPhpIni.find(params[:id])

    if @custom_php_ini.update(custom_php_ini_params)
      redirect_to @custom_php_ini
    else
      render 'edit'
    end
  end

  def destroy
    @custom_php_ini = CustomPhpIni.find(params[:id])
    @custom_php_ini.destroy
    redirect_to @custom_php_ini.blueprint_version
  end

private

  def custom_php_ini_params
    params.require(:custom_php_ini).permit!
  end

end
