class ApacheModulesController < ApplicationController
  def create
       @software = Software.find(params[:software_id])
       @apache_module = @software.apache_modules.create(apache_module_params)
       redirect_to software_path(@software)
     end
   
     def new
       @software = Software.find(params[:software_id])
       @apache_module =ApacheModule.new
     end
     
     def show
        @apache_module = ApacheModule.find(params[:id])
     end
     
     def edit
       @software = Software.find(params[:software_id])
       @apache_module = ApacheModule.find(params[:id])
     end
   
     
     def update
       @apache_module = ApacheModule.find(params[:id])
       @software = Software.find(params[:software_id])
       if @apache_module.update(apache_module_params)
         redirect_to software_apache_module_path(@software,@apache_module)
       else
         render 'edit'
       end
     end
   
     def destroy
       @software = Software.find(params[:software_id])
       @apache_module = ApacheModule.find(params[:id])
       @apache_module.destroy
   
       redirect_to software_path(@software)
     end
      
     
     private
     def apache_module_params
       #NB. I have used 'title' instead of 'name' so it isn't confused with file_name which is included in the path
       params.require(:apache_module).permit(:module,:comment)
     end
     
end
