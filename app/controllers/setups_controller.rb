class SetupsController < ApplicationController

  def new
    @setup = Setup.new
    # @setup.variables.build
  end

  def create
    @setup = Setup.new(setup_params)
    if @setup.save
      redirect_to @setup
    else
      render 'new'
    end
  end

  def show
    @setup = Setup.find(params[:id])
    redirect_to @setup.service_definition
  end

  def index
    @setups = Setup.all
  end

  def edit
    @setup = Setup.find(params[:id])
  end


  def update
    @setup = Setup.find(params[:id])
    if @setup.update(setup_params)
      redirect_to @setup
    else
      render 'edit'
    end
  end

  def destroy
    @setup = Setup.find(params[:id])
    @setup.destroy
    redirect_to setups_path
  end

private

  def setup_params
    params.require(:setup).permit! #(:name, :comment)
  end

end
