class PublishedSoftwareController < ApplicationController
  def create
        @software = Software.find(params[:software_id])
        @published_sofware = @software.published_sofwares.create(published_sofware_variables_params)
        redirect_to   :controller => 'published_sofwares', :action => 'index'
      end
    
       def destroy
         
         
         @published_sofware = PublishedSoftware.find(params[:id])
         @published_sofware.destroy()     
      
         redirect_to  :controller => 'published_sofwares', :action => 'index'
           
       end
       
       
      def edit
            @published_sofware = PublishedSoftware.find(params[:id])
      end
         
        def update
            @published_sofware = PublishedSoftware.find(params[:id])
        
             if @published_sofware.update(published_sofware_variables_params)

                 render 'edit'
             end
         end
         
       
      private
        def published_sofware_variables_params
          params.require(:published_sofware).permit(:short_name, :full_name,:description,:home_page,:image_url,:repository)
        end

end
