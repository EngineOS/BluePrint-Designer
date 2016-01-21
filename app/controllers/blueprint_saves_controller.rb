class BlueprintSavesController < ApplicationController

  def show
    @blueprint_save = BlueprintSave.new(blueprint_version_id: params[:id])
  end

  def create
    @blueprint_save = BlueprintSave.new(blueprint_save_params)
    if @blueprint_save.save
      flash[:notice] = "Blueprint saved."
      redirect_to blueprint_json_path blueprint_save_params[:blueprint_version_id]
    else
      flash[:alert] = "Failed to save."
      redirect_to blueprint_json_path blueprint_save_params[:blueprint_version_id]
    end
  end

private

  def blueprint_save_params
    params.require(:blueprint_save).permit!
  end

end
