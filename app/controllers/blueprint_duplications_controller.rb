# class BlueprintDuplicationsController < ApplicationController
#
#   def show
#     @blueprint_version = BlueprintVersion.find(params[:id])
#     BlueprintDuplication
#     @blueprint_version = BlueprintVersion.find(params[:id])
#   end
#
# private
#
#   def blueprint_version_params
#     params.require(:blueprint_version).permit!
#   end
#
# end
#
#
#
#
#
#   def duplicate
#     existing_blueprint_version = BlueprintVersion.find(params[:id])
#     @blueprint_version = existing_blueprint_version.deep_clone include: attributes_for_duplicate
#     unique_name_for_duplicate
#     if @blueprint_version.save
#       # render text: @blueprint_version.as_json
#       flash[:notice] = "Success."
#       redirect_to @blueprint_version
#     else
#       flash[:error] = "Unable to duplicate Blueprint version."
#       redirect_to existing_blueprint_version
#     end
#
#   end
#
# private
#
#   def unique_name_for_duplicate
#     i = 1
#     original_name = @blueprint_version.name
#     while BlueprintVersion.find_by name: @blueprint_version.name
#       @blueprint_version.name = original_name + " (copy#{ i if i > 1})"
#       i += 1
#     end
#   end
#
#   def attributes_for_duplicate
#
#     [
#       # :software_version,
#       # :blocking_worker,
#       :service_configurations,
#       :persistent_directories,
#       :replacement_strings,
#       :persistent_files,
#       :installed_packages,
#       :system_packages,
#       :ports,
#       :workers,
#       :rake_tasks,
#       :template_files,
#       :file_write_permissions,
#       :custom_php_inis,
#       :apache_htaccess_files,
#       :variables,
#       :component_sources,
#       :apache_httpd_configurations,
#       :blueprint_modules
#     ]
