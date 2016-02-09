class AcceptsController < ApplicationController

  def new
    @accept = Accept.new(service_definition_id: params[:service_definition_id])
  end

  def create
    @accept = Accept.new(accept_params)
    if @accept.save
      redirect_to @accept
    else
      render 'new'
    end
  end

  def show
    @accept = Accept.find(params[:id])
  end
  #
  # def index
  #   @accepts = Accept.all
  # end

  def edit
    @accept = Accept.find(params[:id])
  end


  def update
    @accept = Accept.find(params[:id])
    if @accept.update(accept_params)
      redirect_to @accept
    else
      render 'edit'
    end
  end

  def destroy
    @accept = Accept.find(params[:id])
    @accept.destroy
    redirect_to url_for(@accept.service_definition) + '#accepts'
  end

private

  def accept_params
    params.require(:accept).permit! #(:name, :comment)
  end

end
