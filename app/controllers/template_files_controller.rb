class TemplateFilesController < ApplicationController

  def new
    @template_file = TemplateFile.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @template_file = TemplateFile.new(template_file_params)
    if @template_file.save
      redirect_to @template_file
    else
      render 'new'
    end
  end

  def show
    @template_file = TemplateFile.find(params[:id])
  end

  def edit
    @template_file = TemplateFile.find(params[:id])
  end

  def update
    @template_file = TemplateFile.find(params[:id])

    if @template_file.update(template_file_params)
      redirect_to @template_file
    else
      render 'edit'
    end
  end

  def destroy
    @template_file = TemplateFile.find(params[:id])
    @template_file.destroy
    redirect_to @template_file.blueprint_version
  end

private

  def template_file_params
    params.require(:template_file).permit!
  end

end
