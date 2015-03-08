class ApacheHttpdConfigurationsController < ApplicationController

  def new
    @apache_httpd_configuration = ApacheHttpdConfiguration.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @apache_httpd_configuration = ApacheHttpdConfiguration.new(apache_httpd_configuration_params)
    if @apache_httpd_configuration.save
      redirect_to @apache_httpd_configuration
    else
      render 'new'
    end
  end

  def show
    @apache_httpd_configuration = ApacheHttpdConfiguration.find(params[:id])
  end

  def edit
    @apache_httpd_configuration = ApacheHttpdConfiguration.find(params[:id])
  end

  def update
    @apache_httpd_configuration = ApacheHttpdConfiguration.find(params[:id])

    if @apache_httpd_configuration.update(apache_httpd_configuration_params)
      redirect_to @apache_httpd_configuration
    else
      render 'edit'
    end
  end

  def destroy
    @apache_httpd_configuration = ApacheHttpdConfiguration.find(params[:id])
    @apache_httpd_configuration.destroy
    redirect_to @apache_httpd_configuration.blueprint_version
  end

private

  def apache_httpd_configuration_params
    params.require(:apache_httpd_configuration).permit!
  end

end
