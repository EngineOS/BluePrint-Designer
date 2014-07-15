class InstalledpackagesController < ApplicationController
     def create
    @software = Software.find(params[:software_id])
    @installedpackage = @software.installedpackages.create(installedpackages_params)
    redirect_to editDetails_software_path(@software)
  end
  
  def destroy
            
            @installedpackage = Installedpackage.find(params[:id])
            sid = @installedpackage.software_id
            @installedpackage.destroy()     
         
            redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
              
     end
  
   def edit
         @installedpackage = Installedpackage.find(params[:id])
   end
      
     def update
         @installedpackage = Installedpackage.find(params[:id])
     
          if @installedpackage.update(installedpackages_params)
                   sid = @installedpackage.software_id
                  redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
          else
              render 'edit'
          end
      end   
      
  private
    def installedpackages_params
      params.require(:installedpackage).permit(:name ,:src, :dest, :extractcmd, :comment,:extractdir)
    end


end
