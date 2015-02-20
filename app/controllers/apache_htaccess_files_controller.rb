class ApacheHtaccessFilesController < ApplicationController

  def new
    @apache_htaccess_file = ApacheHtaccessFile.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @apache_htaccess_file = ApacheHtaccessFile.new(apache_htaccess_file_params)
    if @apache_htaccess_file.save
      redirect_to @apache_htaccess_file
    else
      render 'new'
    end
  end

  def show
    @apache_htaccess_file = ApacheHtaccessFile.find(params[:id])
  end

  def edit
    @apache_htaccess_file = ApacheHtaccessFile.find(params[:id])
  end

  def update
    @apache_htaccess_file = ApacheHtaccessFile.find(params[:id])

    if @apache_htaccess_file.update(apache_htaccess_file_params)
      redirect_to @apache_htaccess_file
    else
      render 'edit'
    end
  end

  def destroy
    @apache_htaccess_file = ApacheHtaccessFile.find(params[:id])
    @apache_htaccess_file.destroy
    redirect_to @apache_htaccess_file.blueprint_version
  end

private

  def apache_htaccess_file_params
    params.require(:apache_htaccess_file).permit!
  end

end
