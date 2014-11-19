class TemplateFilesController < ApplicationController
  
  def create
    @software = Software.find(params[:software_id])
    @template_file = @software.template_files.create(template_files_params)
    redirect_to software_path(@software)
  end
  
  private
  def template_files_params
    #NB. I have used 'title' instead of 'name' so it isn't confused with file_name which is included in the path
    params.require(:title,:path,:content).permit(:title,:path,:content)
  end
  
end
