class WorkPortsController < ApplicationController
  def create
      @software = Software.find(params[:software_id])
      @work_port = @software.work_ports.create(work_ports_params)
      redirect_to editDetails_software_path(@software)
    end
  
     def destroy
       
       @work_port = WorkPort.find(params[:id])
       sid = @work_port.software_id
       @work_port.destroy()         
       redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
         
     end
     
     
    def edit
          @work_port = WorkPort.find(params[:id])
    end
       
      def update
          @work_port = WorkPort.find(params[:id])
      
           if @work_port.update(work_ports_params)
                    sid = @work_port.software_id
                   redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
           else
               render 'edit'
           end
       end
            
    private
      def work_ports_params
        params.require(:work_port).permit(:port,:external, :name , :comment,:protocol)
      end

end
