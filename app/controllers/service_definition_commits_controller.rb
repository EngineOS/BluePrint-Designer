class ServiceDefinitionCommitsController < ApplicationController

  def new
    @service_definition_commit = ServiceDefinitionCommit.new(commit_params)
  end
    
  def create
    @service_definition_commit = ServiceDefinitionCommit.new(commit_params)
    if @service_definition_commit.commit(current_user.username)
      flash[:notice] = "Success."
      redirect_to service_definition_path commit_params[:service_definition_id]
    else
      render 'new'
    end
  end

private

  def commit_params
    params.require(:service_definition_commit).permit!
  end

end
