class TemplateFilesController < ApplicationController
  
  def create
    @software = Software.find(params[:software_id])
    @template_file = @software.template_files.create(template_files_params)
    redirect_to software_path(@software)
  end
  
  def new
    @software = Software.find(params[:software_id])
    @template_file = TemplateFile.new
  end
  
  def show
     @template_file = TemplateFile.find(params[:id])
  end
  
  def edit
    @software = Software.find(params[:software_id])
    @template_file = TemplateFile.find(params[:id])
  end

  
  def update
    @template_file = TemplateFile.find(params[:id])
    @software = Software.find(params[:software_id])
    if @template_file.update(template_files_params)
      redirect_to software_template_file_path(@software,@template_file)
    else
      render 'edit'
    end
  end

  def destroy
    @software = Software.find(params[:software_id])
    @template_file = TemplateFile.find(params[:id])
    @template_file.destroy

    redirect_to software_path(@software)
  end
   
  
  private
  def template_files_params
    #NB. I have used 'title' instead of 'name' so it isn't confused with file_name which is included in the path
    params.require(:template_file).permit(:title,:path,:content)
  end
  
end
