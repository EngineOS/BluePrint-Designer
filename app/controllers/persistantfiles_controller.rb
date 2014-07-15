class PersistantfilesController < ApplicationController
        def new
        end

def create
    @software = Software.find(params[:software_id])
    @persistantfile = @software.persistantfiles.create(persistantfile_params)
    redirect_to editDetails_software_path(@software)
  end
  
  def destroy
          
          @persistantfile = Persistantfile.find(params[:id])
          sid = @persistantfile.software_id
          @persistantfile.destroy()     
       
          redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
            
   end
   
  def edit
        @persistantfile = Persistantfile.find(params[:id])
  end
     
    def update
        @persistantfile = Persistantfile.find(params[:id])
    
         if @persistantfile.update(persistantfile_params)
                  sid = @persistantfile.software_id
                 redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
         else
             render 'edit'
         end
     end
     
  private
    def persistantfile_params
      params.require(:persistantfile).permit(:path , :comment)
    end

end
