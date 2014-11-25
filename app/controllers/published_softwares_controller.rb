class PublishedSoftwaresController < ApplicationController
  require 'Publisher.rb'
  def new
  @software = Software.find(params[:software_id])
  #@published_software = PublishedSoftware.new
    @software.published_software = PublishedSoftware.new
    require 'socket'
    hostname = Socket.gethostname
    @gitpath = "git://" +  hostname + "/test-deploy/" +   @software.name
      
  end

  def detailslist
    @published_softwares = PublishedSoftware.all
    respond_to do |format|
           format.json { render json: @published_softwares }
            format.html {}
     end
    
  end
       def destroy                
         @published_software = PublishedSoftware.find(params[:id])
         @published_software.destroy()     
      
         redirect_to  :controller => 'published_softwares', :action => 'index'
           
       end
       
       
      def edit
            @published_software = PublishedSoftware.find(params[:id])
           
            
      end
  def show
    @published_software = PublishedSoftware.find(params[:id])
    respond_to do |format|
         format.json { render json: @published_software }
         format.html {}
       end
  end

  def index
    @published_softwares = PublishedSoftware.all
    respond_to do |format|
          format.json { render json: @published_softwares }
          format.html {}
    end
  end


        def update
            @published_software = PublishedSoftware.find(params[:id])
        
             if @published_software.update(published_software_variables_params)
               @published_softwares = PublishedSoftware.all
               @software = Software.find(@published_software.software_id)
               @result = Publisher.publishtest @software
                 render 'index'
             end
         end


       
      private
        def published_software_variables_params
          params.require(:published_software).permit(:short_name, :full_name,:description,:home_page,:image_url,:repository,:software_id)
        end

end
