class PersistentDirectoriesController < ApplicationController

  def new
    @persistent_directory = PersistentDirectory.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @persistent_directory = PersistentDirectory.new(persistent_directory_params)
    if @persistent_directory.save
      redirect_to ( url_for( @persistent_directory.blueprint_version ) + '#' + @persistent_directory.class.name.underscore + '_' + @persistent_directory.id.to_s )
    else
      render 'new'
    end
  end

  def show
    @persistent_directory = PersistentDirectory.find(params[:id])
  end

  def edit
    @persistent_directory = PersistentDirectory.find(params[:id])
  end

  def update
    @persistent_directory = PersistentDirectory.find(params[:id])

    if @persistent_directory.update(persistent_directory_params)
      redirect_to ( url_for( @persistent_directory.blueprint_version ) + '#' + @persistent_directory.class.name.underscore + '_' + @persistent_directory.id.to_s )
    else
      render 'edit'
    end
  end

  def destroy
    @persistent_directory = PersistentDirectory.find(params[:id])
    @persistent_directory.destroy
    redirect_to ( url_for( @persistent_directory.blueprint_version ) + '#' + @persistent_directory.class.name.pluralize.underscore )
  end

private

  def persistent_directory_params
    params.require(:persistent_directory).permit!
  end

end
