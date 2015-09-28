class BlueprintCommitsController < ApplicationController

  def new
    @blueprint_commit = BlueprintCommit.new(commit_params)
  end
    
  def create
    @blueprint_commit = BlueprintCommit.new(commit_params)
    if @blueprint_commit.commit(current_user.username)
      flash[:notice] = "Success."
      redirect_to blueprint_version_path commit_params[:blueprint_version_id]
    else
      render 'new'
    end
  end

private

  def commit_params
    params.require(:blueprint_commit).permit!
  end

end
