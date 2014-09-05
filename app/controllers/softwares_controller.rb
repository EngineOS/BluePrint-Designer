require 'Publisher.rb'
class SoftwaresController < ApplicationController

	def new
	 @software = Software.new
	end

	  def publish
      @software = Software.find(params[:id])
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
     @result =  Publisher.publishtest @software 
	end

 
 
private
  def software_params
    params.require(:software).permit(:name, :icon_url,:description, :langauge_id, :mysql , :pgsql, :filesystem, :swframework_id,:license_id, :softwaredeploytype_id, :requiredmemory,:toconfigurefile,:configuredfile)
end

end
