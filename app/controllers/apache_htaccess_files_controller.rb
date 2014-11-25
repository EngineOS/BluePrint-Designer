class ApacheHtaccessFilesController < ApplicationController
  def create
    @software = Software.find(params[:software_id])
    @apache_htaccess_file = @software.apache_htaccess_files.create(apache_htaccess_file_params)
    redirect_to editDetails_software_path(@software)
  end
  
   def destroy
     
     @apache_htaccess_file = ApacheHtaccessFile.find(params[:id])
     sid = @apache_htaccess_file.software_id
     @apache_htaccess_file.destroy()     
  
     redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
       
   end
   
   
  def edit
        @apache_htaccess_file = ApacheHtaccessFile.find(params[:id])
  end
     
    def update
        @apache_htaccess_file = ApacheHtaccessFile.find(params[:id])
    
         if @apache_htaccess_file.update(apache_htaccess_file_params)
                  sid = @apache_htaccess_file.software_id
                 redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
         else
             render 'edit'
         end
     end
     
   
  private
    def apache_htaccess_file_params
      params.require(:apache_htaccess_file).permit(:directory,:htaccess_content , :comment)
    end
end
