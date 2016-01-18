class RepositoryResetServiceDefinitionsController < ApplicationController

  def show
    Repository::Repository.new.reset_service_definitions
    redirect_to repository_service_definitions_path, notice: 'The Service definitions repository has been reset.'
  end

end
