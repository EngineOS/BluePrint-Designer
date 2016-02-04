class BlueprintCommitsController < ApplicationController

  def show
    @blueprint_commit = BlueprintCommit.new(blueprint_version_id: params[:id])
  end

  def create
    @blueprint_commit = BlueprintCommit.new(blueprint_commit_params)
    if @blueprint_commit.save
      flash[:notice] = "Blueprint saved."
      redirect_to blueprint_json_path blueprint_commit_params[:blueprint_version_id]
    else
      flash[:alert] = "Failed to save."
      redirect_to blueprint_json_path blueprint_commit_params[:blueprint_version_id]
    end
  end

private

  def blueprint_commit_params
    params.require(:blueprint_commit).permit!
  end

end
