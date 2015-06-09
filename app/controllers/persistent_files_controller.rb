class PersistentFilesController < ApplicationController

  def new
    @persistent_file = PersistentFile.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @persistent_file = PersistentFile.new(persistent_file_params)
    if @persistent_file.save
      redirect_to ( url_for( @persistent_file.blueprint_version ) + '#' + @persistent_file.class.name.underscore + '_' + @persistent_file.id.to_s )
    else
      render 'new'
    end
  end

  def show
    @persistent_file = PersistentFile.find(params[:id])
  end

  def edit
    @persistent_file = PersistentFile.find(params[:id])
  end

  def update
    @persistent_file = PersistentFile.find(params[:id])

    if @persistent_file.update(persistent_file_params)
      redirect_to ( url_for( @persistent_file.blueprint_version ) + '#' + @persistent_file.class.name.underscore + '_' + @persistent_file.id.to_s )
    else
      render 'edit'
    end
  end

  def destroy
    @persistent_file = PersistentFile.find(params[:id])
    @persistent_file.destroy
    redirect_to ( url_for( @persistent_file.blueprint_version ) + '#' + @persistent_file.class.name.pluralize.underscore )
  end

private

  def persistent_file_params
    params.require(:persistent_file).permit!
  end

end
