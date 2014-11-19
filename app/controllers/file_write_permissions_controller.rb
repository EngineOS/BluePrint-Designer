class FileWritePermissionsController < ApplicationController
  

  def new
  end
 
def create
    @software = Software.find(params[:software_id])
    @file_write_permission = @software.file_write_permissions.create(file_write_permissions_params)
    redirect_to editDetails_software_path(@software)
  end
  
  def destroy
         
         @file_write_permissions = FileWritePermission.find(params[:id])
         sid = @file_write_permissions.software_id
         @file_write_permissions.destroy()     
      
         redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
           
       end
       
  def edit
      @file_write_permissions = FileWritePermission.find(params[:id])
   end
   

  def update
      @file_write_permissions = FileWritePermission.find(params[:id])
  
       if @file_write_permissions.update(file_write_permissions_params)
                sid = @file_write_permissions.software_id
               redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
       else
           render 'edit'
       end
   end
   
  private
    def file_write_permissions_params
      params.require(:file_write_permission).permit(:path , :title,:recursive)
 
    end
end
