class PortsController < ApplicationController

  def new
    @port = Port.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @port = Port.new(port_params)
    if @port.save
      redirect_to ( url_for( @port.blueprint_version ) + '#' + @port.class.name.underscore + '_' + @port.id.to_s )
    else
      render 'new'
    end
  end

  def show
    @port = Port.find(params[:id])
  end

  def edit
    @port = Port.find(params[:id])
  end

  def update
    @port = Port.find(params[:id])

    if @port.update(port_params)
      redirect_to ( url_for( @port.blueprint_version ) + '#' + @port.class.name.underscore + '_' + @port.id.to_s )
    else
      render 'edit'
    end
  end

  def destroy
    @port = Port.find(params[:id])
    @port.destroy
    redirect_to ( url_for( @port.blueprint_version ) + '#' + @port.class.name.pluralize.underscore )
  end

private

  def port_params
    params.require(:port).permit!
  end

end