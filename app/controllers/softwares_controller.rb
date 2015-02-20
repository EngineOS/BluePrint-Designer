class SoftwaresController < ApplicationController

  def new
    @software = Software.new
  end

  def create
    @software = Software.new(software_params)

    if @software.save
      redirect_to @software
    else
      render 'new'
    end

  end

  def show
    @software = Software.find(params[:id])
  end

  def index
    @softwares = Software.all
  end

  def edit
    @software = Software.find(params[:id])
  end

  def update
    @software = Software.find(params[:id])

    if @software.update(software_params)
      redirect_to @software
    else
      render 'edit'
    end
  end

  def destroy
    @software = Software.find(params[:id])
    @software.destroy
    redirect_to softwares_path
  end

private

  def software_params
    params.require(:software).permit!
  end

end
