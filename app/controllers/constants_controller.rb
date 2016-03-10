class ConstantsController < ApplicationController

  def new
    @constant = Constant.new(service_definition_id: params[:service_definition_id])
  end

  def create
    @constant = Constant.new(constant_params)
    if @constant.save
      redirect_to url_for(@constant.service_definition) + '#constant_' + @constant.id.to_s
    else
      render 'new'
    end
  end

  def show
    @constant = Constant.find(params[:id])
  end

  def index
    @constants = Constant.all
  end

  def edit
    @constant = Constant.find(params[:id])
  end


  def update
    @constant = Constant.find(params[:id])
    if @constant.update(constant_params)
      redirect_to url_for(@constant.service_definition) + '#constant_' + @constant.id.to_s
    else
      render 'edit'
    end
  end

  def destroy
    @constant = Constant.find(params[:id])
    @constant.destroy
    redirect_to url_for(@constant.service_definition) + '#constants'
  end

private

  def constant_params
    params.require(:constant).permit! #(:name, :comment)
  end

end
