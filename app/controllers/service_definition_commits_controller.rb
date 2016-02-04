class ServiceDefinitionCommitsController < ApplicationController

  def show
    @service_definition_commit = ServiceDefinitionCommit.new(service_definition_id: params[:id])
  end


  # def show
  #   @service_definition_commit = ServiceDefinitionCommit.find(params[:id])
  #   if @service_definition_commit.save_to_repository
  #     flash[:notice] = "Service definition saved."
  #     redirect_to service_definition_yaml_path params[:id]
  #   else
  #     flash[:alert] = "Failed to save."
  #     redirect_to service_definition_yaml_path params[:id]
  #   end
  # end

  def create
    @service_definition_commit = ServiceDefinitionCommit.new(service_definition_commit_params)
    if @service_definition_commit.save
      flash[:notice] = "Service definition committed."
      redirect_to service_definition_yaml_path service_definition_commit_params[:service_definition_id]
    else
      flash[:alert] = "Failed to commit service definition."
      redirect_to service_definition_yaml_path service_definition_commit_params[:service_definition_id]
    end
  end

private

  def service_definition_commit_params
    params.require(:service_definition_commit).permit!
  end

end
