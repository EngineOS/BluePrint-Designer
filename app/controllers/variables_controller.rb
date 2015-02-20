class VariablesController < ApplicationController

  def new
    @variable = Variable.new(
                  variable_consumer_id: params[:variable_consumer_id],
                  variable_consumer_type: params[:variable_consumer_type] )
  end

  def create
    @variable = Variable.new(variable_params)
    if @variable.save
      redirect_to @variable
    else
      render 'new'
    end
  end

  def show
    @variable = Variable.find(params[:id])
  end

def index
  # Variable.destroy_all
  @variables = Variable.all
end

  def edit
    @variable = Variable.find(params[:id])
  end

  def update
    @variable = Variable.find(params[:id])

    if @variable.update(variable_params)
      redirect_to @variable
    else
      render 'edit'
    end
  end

  def destroy
    @variable = Variable.find(params[:id])
    @variable.destroy
    redirect_to @variable.blueprint_version
  end

private

  def variable_params
    params.require(:variable).permit!
  end

end
