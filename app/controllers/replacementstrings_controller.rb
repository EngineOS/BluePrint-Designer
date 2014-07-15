class ReplacementstringsController < ApplicationController
        def new
        end

def create
    @software = Software.find(params[:software_id])
    @replacementstring = @software.replacementstrings.create(replacementstrings_params)
    redirect_to editDetails_software_path(@software)
  end
  def destroy
      
      @replacementstring = Replacementstring.find(params[:id])
      sid = @replacementstring.software_id
      @replacementstring.destroy()     
   
      redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid
        
    end
    

  def edit
        @replacementstring = Replacementstring.find(params[:id])
  end
     
    def update
        @replacementstring = Replacementstring.find(params[:id])
    
         if @replacementstring.update(replacementstrings_params)
                  sid = @replacementstring.software_id
                 redirect_to  :controller => 'softwares', :action => 'editDetails', :id => sid        
         else
             render 'edit'
         end
     end   
        
  private
    def replacementstrings_params
      params.require(:replacementstring).permit(:sedstr,:file ,:dest, :comment)
    end
end
