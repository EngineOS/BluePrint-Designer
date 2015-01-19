require 'Publisher.rb'
class SoftwaresController < ApplicationController
  require 'json'
	def new
	 software = Software.new
  
	end

	  def publish
      @software = Software.find(params[:id])
      redirect_to software.published_software.build
	  end
	  
	def create
	 @software = Software.new(software_params)
 
  		if @software.save
  			redirect_to @software
		else
			render 'new'
		end
	end
		
		def editDetails
      @software = Software.find(params[:id])
		end
	
	

	def show
	  @software = Software.find(params[:id])
	end

	def index
	 @softwares = Software.all
	end

	def edit
  	 @software = Software.find(params[:id])
	end

	
	def update
  	 @software = Software.find(params[:id])
 
  		if @software.update(software_params)
    		    	redirect_to @software
  		else
    			render 'edit'
  		end
	end

	def destroy
	  @software = Software.find(params[:id])
	  @software.destroy

	  redirect_to softwares_path
	end
	
	def testBuild
    @software = Software.find(params[:id])
      publisher = Publisher.new(@software)
     @result =  publisher.publishtest 
	end

 
 

  def software_params
    params.require(:software).permit(:web_port_overide,:custom_start_script, :custom_install_script, :custom_post_install_script,:name, :icon_url,:description, :langauge_id, :mysql , :pgsql, :filesystem, :swframework_id,:license_id, :softwaredeploytype_id, :requiredmemory,:toconfigurefile,:configuredfile)
end

end
