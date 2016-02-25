class ActionatorsController < ApplicationController

  def new
    @actionator = Actionator.new(service_definition_id: params[:service_definition_id])
    # @actionator.variables.build
  end

  def create
    @actionator = Actionator.new(actionator_params)
    if @actionator.save
      redirect_to @actionator
    else
      render 'new'
    end
  end

  def show
    @actionator = Actionator.find(params[:id])
  end

  def index
    @actionators = Actionator.all
  end

  def edit
    @actionator = Actionator.find(params[:id])
  end


  def update
    @actionator = Actionator.find(params[:id])
    if @actionator.update(actionator_params)
      redirect_to @actionator
    else
      render 'edit'
    end
  end

  def destroy
    @actionator = Actionator.find(params[:id])
    @actionator.destroy
    redirect_to url_for(@actionator.service_definition) + '#actionators'
  end

private

  def actionator_params
    params.require(:actionator).permit! #(:name, :comment)
  end

end
