class WorkerCommandsController < ApplicationController
  def create
        @software = Software.find(params[:software_id])
        @worker_command = @software.worker_commands.create(worker_commands_params)
        redirect_to editDetails_software_path(@software)
      end
    
       def destroy
         
         @worker_command = WorkerCommand.find(params[:id])
         sid = @worker_command.software_id
         @worker_command.destroy()     
      
         redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
           
       end
       
       
      def edit
            @worker_command = WorkPort.find(params[:id])
      end
         
        def update
            @worker_command = WorkPort.find(params[:id])
        
             if @worker_command.update(worker_commands_params)
                      sid = @worker_command.software_id
                     redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
             else
                 render 'edit'
             end
         end
         
       
      private
        def worker_commands_params
          params.require(:worker_command).permit(:command, :name , :comment)
        end

end
