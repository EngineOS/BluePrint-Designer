class FileWritePermissionsController < ApplicationController

  def new
    @file_write_permission = FileWritePermission.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @file_write_permission = FileWritePermission.new(file_write_permission_params)
    if @file_write_permission.save
      redirect_to ( url_for( @file_write_permission.blueprint_version ) + '#' + @file_write_permission.class.name.underscore + '_' + @file_write_permission.id.to_s )
    else
      render 'new'
    end
  end

  # def show
  #   @file_write_permission = FileWritePermission.find(params[:id])
  # end

  def edit
    @file_write_permission = FileWritePermission.find(params[:id])
  end

  def update
    @file_write_permission = FileWritePermission.find(params[:id])

    if @file_write_permission.update(file_write_permission_params)
      redirect_to ( url_for( @file_write_permission.blueprint_version ) + '#' + @file_write_permission.class.name.underscore + '_' + @file_write_permission.id.to_s )
    else
      render 'edit'
    end
  end

  def destroy
    @file_write_permission = FileWritePermission.find(params[:id])
    @file_write_permission.destroy
      redirect_to ( url_for( @file_write_permission.blueprint_version ) + '#' + @file_write_permission.class.name.pluralize.underscore )
  end

private

  def file_write_permission_params
    params.require(:file_write_permission).permit!
  end

end
