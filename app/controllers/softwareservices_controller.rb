class SoftwareservicesController < ApplicationController
  def new
         end
 
 def create
   @software = Software.find(params[:software_id])
      @softwareservice= @software.softwareservices.create(softwareservices_params)
      redirect_to editDetails_software_path(@software)
   
 end
 
  def destroy
       
       @softwareservice = Softwareservice.find(params[:id])
       sid = @softwareservice.software_id
       @softwareservice.destroy()     
    
       redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
         
     end
   
  def edit
        @softwareservice = Softwareservice.find(params[:id])
  end
  
  def servicename
    @softwareservice = Softwareservice.find(params[:id])
    @dashname = @softwareservice.name.strip
    @dashname = @dashname.sub(/ /,'-')
  end
     
    def update
        @softwareservice = Softwareservice.find(params[:id])
    
         if @softwareservice.update(softwareservices_params)
                  sid = @softwareservice.software_id
                 redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
         else
             render 'edit'
         end
     end
      
   private
     def softwareservices_params
       params.require(:softwareservice).permit(:name , :dest, :comment, :software_id, :servicetype_id)
     end
end
