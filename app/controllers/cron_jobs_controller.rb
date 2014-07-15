class CronJobsController < ApplicationController
  def create
      @software = Software.find(params[:software_id])
      @cron_job = @software.cron_jobs.create(cron_jobs_params)
      redirect_to editDetails_software_path(@software)
    end
  
     def destroy
       
       @cronjob = CronJob.find(params[:id])
       sid = @cronjob.software_id
       @cronjob.destroy()     
    
       redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
         
     end
     
     
    def edit
          @cronjob = CronJob.find(params[:id])
    end
       
      def update
          @cronjob = CronJob.find(params[:id])
      
           if @cronjob.update(cron_jobs_params)
                    sid = @cronjob.software_id
                   redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
           else
               render 'edit'
           end
       end
       
     
    private
      def cron_jobs_params
        params.require(:cron_job).permit(:cronjob , :description)
      end

end
