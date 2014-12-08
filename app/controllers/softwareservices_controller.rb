class SoftwareservicesController < ApplicationController
  def new
         end
 
 def create
   @software = Software.find(params[:software_id])
      @softwareservice= @software.softwareservices.create(softwareservices_params)
      environments = ServiceTypeEnvironmentVariable.where( servicetype_id: softwareservices_params[:servicetype_id])
        environments.each do |variable|
          p variable 
          p variable.name
          @software.environment_variables.create(
                                                software_id: params[:software_id],
                                                name: variable.name, 
                                                value: variable.value,
                                                ask_at_build_time: variable.ask_at_runtime,
                                                comment: variable.comment,
                                                build_time_only: variable.build_time_only,
                                                mandatory: variable.mandatory
                                                
                                                )
        end
      
      redirect_to editDetails_software_path(@software)
   
 end
 
  def destroy
       
       @softwareservice = Softwareservice.find(params[:id])
       sid = @softwareservice.software_id
       @softwareservice.destroy()     
    
       redirect_to  controller:  'softwares', action:  'editDetails', id:  sid
         
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
