class BlueprintJsonsController < ApplicationController

  def show
    @blueprint_version = BlueprintVersion.find(params[:id])
  end

private

  def blueprint_version_params
    params.require(:blueprint_version).permit!
  end

end