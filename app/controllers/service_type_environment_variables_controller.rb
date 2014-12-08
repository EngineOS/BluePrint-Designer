class ServiceTypeEnvironmentVariablesController < ApplicationController

  def create
    @servicetype = Servicetype.find(params[:servicetype_id])
    @environment_variable = @servicetype.service_type_environment_variables.create(service_type_environment_varaibles_params)
    redirect_to servicetype_path(@servicetype)
  end
  
  def new
    @servicetype = Servicetype.find(params[:servicetype_id])
    @environment_variable = ServiceTypeEnvironmentVariable.new
  end
  
  def show
     @environment_variable = ServiceTypeEnvironmentVariable.find(params[:id])
  end
  
  def edit
    @servicetype =  Servicetype.find(params[:servicetype_id])
    @environment_variable = ServiceTypeEnvironmentVariable.find(params[:id])
  end

  
  def update
    @template_file = ServiceTypeEnvironmentVariable.find(params[:id])
    @servicetype = Servicetype.find(params[:servicetype_id])
    if @environment_variable.update(service_type_environment_varaibles_params)
      redirect_to software_template_file_path(@servicetype,@environment_variable)
    else
      render 'edit'
    end
  end

  def destroy
    @servicetype = Servicetype.find(params[:servicetype_id])
    @environment_variable = ServiceTypeEnvironmentVariable.find(params[:id])
    @environment_variable.destroy

    redirect_to software_path(@servicetype)
  end
   
  
  private
  def service_type_environment_varaibles_params
    #NB. I have used 'title' instead of 'name' so it isn't confused with file_name which is included in the path
    params.require(:service_type_environment_variable).permit(:name,:value,:comment,:ask_at_build_time,:mandatory,:build_time_only)
  end
  
end  