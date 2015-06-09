class WorkersController < ApplicationController

  def new
    @worker = Worker.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to ( url_for( @worker.blueprint_version ) + '#' + @worker.class.name.underscore + '_' + @worker.id.to_s )
    else
      render 'new'
    end
  end

  # def show
  #   @worker = Worker.find(params[:id])
  # end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])

    if @worker.update(worker_params)
      redirect_to ( url_for( @worker.blueprint_version ) + '#' + @worker.class.name.underscore + '_' + @worker.id.to_s )
    else
      render 'edit'
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy
    redirect_to ( url_for( @worker.blueprint_version ) + '#' + @worker.class.name.pluralize.underscore )
  end

private

  def worker_params
    params.require(:worker).permit!
  end

end
