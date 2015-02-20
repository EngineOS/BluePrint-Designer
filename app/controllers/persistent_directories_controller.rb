class PersistentDirectoriesController < ApplicationController

  def new
    @persistent_directories = PersistentDirectory.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @persistent_directories = PersistentDirectory.new(persistent_directories_params)
    if @persistent_directories.save
      redirect_to @persistent_directories
    else
      render 'new'
    end
  end

  def show
    @persistent_directories = PersistentDirectory.find(params[:id])
  end

  def edit
    @persistent_directories = PersistentDirectory.find(params[:id])
  end

  def update
    @persistent_directories = PersistentDirectory.find(params[:id])

    if @persistent_directories.update(persistent_directories_params)
      redirect_to @persistent_directories
    else
      render 'edit'
    end
  end

  def destroy
    @persistent_directories = PersistentDirectory.find(params[:id])
    @persistent_directories.destroy
    redirect_to @persistent_directories.blueprint_version
  end

private

  def persistent_directories_params
    params.require(:persistent_directories).permit!
  end

end
