class PersistantdirsController < ApplicationController

	def new
	end

def create
    @software = Software.find(params[:software_id])
    @persistantdir = @software.persistantdirs.create(persistantdir_params)
    redirect_to editDetails_software_path(@software)
  end
  
  def destroy
         
         @persistantdir = Persistantdir.find(params[:id])
         sid = @persistantdir.software_id
         @persistantdir.destroy()     
      
         redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
           
       end
       
  def edit
      @persistantdir = Persistantdir.find(params[:id])
   end
   
  def update
      @persistantdir = Persistantdir.find(params[:id])
  
       if @persistantdir.update(persistantdir_params)
                sid = @persistantdir.software_id
               redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
       else
           render 'edit'
       end
   end
   
  private
    def persistantdir_params
      params.require(:persistantdir).permit(:path , :comment)
    end
end
