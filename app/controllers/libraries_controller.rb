class LibrariesController < ApplicationController

  def engines_installer_software_json
    render json: BlueprintVersion.all.
              map{|software| software.library_software_record}.
              map{|software| software[:repository_url] = software[:repository_url].
                gsub('__HOST_WITH_PORT__', request.host_with_port); software}
  end

  def individual_software_json
    render json: BlueprintVersion.find(params[:id])
  end

end
