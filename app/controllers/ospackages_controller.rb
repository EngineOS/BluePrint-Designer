class OspackagesController < ApplicationController
	def create
    @software = Software.find(params[:software_id])
    @ospackage = @software.ospackages.create(ospackages_params)
    redirect_to editDetails_software_path(@software)
  end

   def destroy
     
     @ospackage = Ospackage.find(params[:id])
     sid = @ospackage.software_id
     @ospackage.destroy()     
  
     redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
       
   end
   
   
  def edit
        @ospackage = Ospackage.find(params[:id])
  end
     
    def update
        @ospackage = Ospackage.find(params[:id])
    
         if @ospackage.update(ospackages_params)
                  sid = @ospackage.software_id
                 redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
         else
             render 'edit'
         end
     end
     
   
  private
    def ospackages_params
      params.require(:ospackage).permit(:name , :comment)
    end

end
