class CustomPhpInisController < ApplicationController
  def create
      @software = Software.find(params[:software_id])
      @custom_php_ini = @software.custom_php_inis.create(custom_php_ini_params)
      redirect_to software_path(@software)
    end
  
    def new
      @software = Software.find(params[:software_id])
      @custom_php_ini = CustomPhpIni.new
    end
    
    def show
       @custom_php_ini = CustomPhpIni.find(params[:id])
    end
    
    def edit
      @software = Software.find(params[:software_id])
      @custom_php_ini = CustomPhpIni.find(params[:id])
    end
  
    
    def update
      @custom_php_ini = CustomPhpIni.find(params[:id])
      @software = Software.find(params[:software_id])
      if @custom_php_ini.update(custom_php_ini_params)
        redirect_to software_custom_php_ini_path(@software,@custom_php_ini)
      else
        render 'edit'
      end
    end
  
    def destroy
      @software = Software.find(params[:software_id])
      @custom_php_ini = CustomPhpIni.find(params[:id])
      @custom_php_ini.destroy
  
      redirect_to software_path(@software)
    end
     
    
    private
    def custom_php_ini_params
      #NB. I have used 'title' instead of 'name' so it isn't confused with file_name which is included in the path
      params.require(:custom_php_ini).permit(:title,:content)
    end
    
end
