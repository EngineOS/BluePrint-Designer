class FrameworksController < ApplicationController

  def new
    @framework = Framework.new
  end

  def create
    @framework = Framework.new(framework_params)
    if @framework.save
      redirect_to @framework
    else
      render 'new'
    end
  end

  def show
    @framework = Framework.find(params[:id])
  end

  def index
    @frameworks = Framework.all
  end

  def edit
    @framework = Framework.find(params[:id])
  end


  def update
    @framework = Framework.find(params[:id])
    if @framework.update(framework_params)
      redirect_to @framework
    else
      render 'edit'
    end
  end

  def destroy
    @framework = Framework.find(params[:id])
    @framework.destroy
    redirect_to frameworks_path
  end

private

  def framework_params
    params.require(:framework).permit! #(:name, :comment, :language_id)
  end

end
