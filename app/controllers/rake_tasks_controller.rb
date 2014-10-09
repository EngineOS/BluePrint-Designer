class RakeTasksController < ApplicationController
  def create
         @software = Software.find(params[:software_id])
         @rake_task = @software.rake_tasks.create(rake_tasks_params)
         redirect_to editDetails_software_path(@software)
       end
     
        def destroy
          
          @rake_task = RakeTask.find(params[:id])
          sid = @rake_task.software_id
          @rake_task.destroy()     
       
          redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
            
        end
        
        
       def edit
             @rake_task = RakeTask.find(params[:id])
       end
          
         def update
             @rake_task = RakeTask.find(params[:id])
         
              if @rake_task.update(rake_tasks_params)
                       sid = @rake_task.software_id
                      redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
              else
                  render 'edit'
              end
          end
          
        
       private
         def rake_tasks_params
           params.require(:rake_task).permit(:name ,:action)
         end

end
