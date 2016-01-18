class BlueprintSavesController < ApplicationController

  def show
    @blueprint = BlueprintVersion.find(params[:id])
    if @blueprint.save_to_repository
      flash[:notice] = "Blueprint saved."
      redirect_to blueprint_version_path params[:id]
    else
      flash[:alert] = "Failed to save."
      redirect_to blueprint_version_path params[:id]
    end
  end

end
