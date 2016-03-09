class ServiceDefinitionsCommitsController < ApplicationController

  def show
    @service_definitions_commit = ServiceDefinitionsCommit.new
  end

  def create
    @service_definitions_commit = ServiceDefinitionsCommit.new(service_definitions_commit_params)
    if @service_definitions_commit.save
      flash[:notice] = "All service definitions committed."
      redirect_to service_definitions_path
    else
      flash[:alert] = "Failed to commit service definitions."
      redirect_to service_definitions_path
    end
  end

private

  def service_definitions_commit_params
    params.require(:service_definitions_commit).permit!
  end

end
