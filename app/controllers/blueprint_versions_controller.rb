class BlueprintVersionsController < ApplicationController

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
  


  def duplicate
    existing_blueprint_version = BlueprintVersion.find(params[:id])
    @blueprint_version = existing_blueprint_version.deep_clone include: attributes_for_duplicate
    unique_name_for_duplicate
    if @blueprint_version.save
      # render text: @blueprint_version.as_json
      flash[:notice] = "Success."
      redirect_to @blueprint_version
    else
      flash[:error] = "Unable to duplicate Blueprint version."
      redirect_to existing_blueprint_version
    end

  end

  def test_install
    @blueprint_version = BlueprintVersion.find(params[:id])
    # publisher = Publisher.new(@blueprint_version)
    # @result =  publisher.publishtest
    if false #@result.was_success?
      flash.now[:notice] = "Success"
    else
      flash.now[:error] = "Big fat fail."
    end
    render :publish
  end

  def commit_to_repository
    @blueprint_version = BlueprintVersion.find(params[:id])
    # publisher = Publisher.new(@blueprint_version)
    # @result =  publisher.publishtest
    if false #@result.was_success?
      flash.now[:notice] = "Success"
    else
      flash.now[:error] = "Big fat fail."
    end
    render :publish
  end

  # def post_to_gallery
  #   @blueprint_version = BlueprintVersion.find(params[:id])
  #   # publisher = Publisher.new(@blueprint_version)
  #   # @result =  publisher.publishtest
  #   if false #@result.was_success?
  #     flash.now[:notice] = "Success"
  #   else
  #     flash.now[:error] = "Big fat fail."
  #   end
  #   render :publish
  # end

private

  def unique_name_for_duplicate
    i = 1
    original_name = @blueprint_version.name
    while BlueprintVersion.find_by name: @blueprint_version.name
      @blueprint_version.name = original_name + " (copy#{ i if i > 1})"
      i += 1
    end
  end

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

  def attributes_for_duplicate

    [
      # :software_version,
      # :blocking_worker,
      :service_configurations,
      :persistent_directories,
      :replacement_strings,
      :persistent_files,
      :installed_packages,
      :system_packages,
      :ports,
      :workers,
      :rake_tasks,
      :template_files,
      :file_write_permissions,
      :custom_php_inis,
      :apache_htaccess_files,
      :variables,
      :component_sources,
      :apache_httpd_configurations,
      :blueprint_modules
    ]

  # has_many :ports, dependent: :destroy
  # has_many :service_configuration_variables, as: :variable_consumer, through: :service_configurations

  end

end
