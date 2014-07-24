class EnvironmentVariablesController < ApplicationController
  def create
       @software = Software.find(params[:software_id])
       @environment_variable = @software.environment_variables.create(environment_variables_params)
       redirect_to editDetails_software_path(@software)
     end
   
      def destroy
        
        @cronjob = EnvironmentVariable.find(params[:id])
        sid = @cronjob.software_id
        @cronjob.destroy()     
     
        redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
          
      end
      
      
     def edit
           @cronjob = EnvironmentVariable.find(params[:id])
     end
        
       def update
           @cronjob = EnvironmentVariable.find(params[:id])
       
            if @cronjob.update(environment_variables_params)
                     sid = @cronjob.software_id
                    redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
            else
                render 'edit'
            end
        end
        
      
     private
       def environment_variables_params
         params.require(:environment_variable).permit(:name ,:value, :ask_at_runtime, :description)
       end

end
