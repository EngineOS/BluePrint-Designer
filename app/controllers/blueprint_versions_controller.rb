class BlueprintVersionsController < ApplicationController

  before_action :authenticate_user!

  require 'BlueprintGiterator.rb'
  require 'json'

  def new
    @blueprint_version = BlueprintVersion.new(software_version_id: params[:software_version_id])
    @blueprint_version.service_configurations.build
    @blueprint_version.persistent_directories.build
    @blueprint_version.replacement_strings.build
    @blueprint_version.persistent_files.build
    @blueprint_version.installed_packages.build
    @blueprint_version.system_packages.build
    # @blueprint_version.ports.build
    @blueprint_version.workers.build
    @blueprint_version.rake_tasks.build
    @blueprint_version.template_files.build
    @blueprint_version.file_write_permissions.build
    @blueprint_version.custom_php_inis.build
    @blueprint_version.apache_htaccess_files.build
    @blueprint_version.apache_modules.build
    @blueprint_version.variables.build
  end
    
  def create
    @blueprint_version = BlueprintVersion.new(blueprint_version_params)
    if @blueprint_version.save
      redirect_to @blueprint_version
    else
      render 'new'
    end
  end
    
  def show
    @blueprint_version = BlueprintVersion.find(params[:id])
  end

  # def index
  #  @blueprint_versions = BlueprintVersion.all
  # end

  def edit
     @blueprint_version = BlueprintVersion.find(params[:id])
  end
  
  def update
    @blueprint_version = BlueprintVersion.find(params[:id])
    if @blueprint_version.update(blueprint_version_params)
      redirect_to @blueprint_version
    else
      render 'edit'
    end
  end

  def destroy
    @blueprint_version = BlueprintVersion.find(params[:id])
    @blueprint_version.destroy
    redirect_to @blueprint_version.software_version
  end
  
  def testBuild
    @blueprint_version = BlueprintVersion.find(params[:id])
    publisher = Publisher.new(@blueprint_version)
    @result =  publisher.publishtest 
  end

  def edit_details
    @blueprint_version = BlueprintVersion.find(params[:id])
  end

  def publish
    @blueprint_version = BlueprintVersion.find(params[:id])
    redirect_to software.published_software.build
  end

private

  def blueprint_version_params
    params.require(:blueprint_version).permit!
    # (
    #   :name,
    #   :comment,
    #   :source,
    #   :mysql,
    #   :pgsql,
    #   :filesystem,
    #   :deployed,
    #   :blueprint_version,
    #   :language_id,
    #   :license_id,
    #   :owner_id,
    #   :framework_id,
    #   :deployment_type_id,
    #   :required_memory,
    #   :port_id,
    #   :worker_id,
    #   :blocking_worker_id,
    #   :icon_url,
    #   :rake_task_id,
    #   :custom_start_script,
    #   :custom_install_script,
    #   :custom_post_install_script,
    #   :http_protocol,
    #   :web_port_overide)
  end

end
