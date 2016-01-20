class ConsumersController < ApplicationController

  def new
    @consumer = Consumer.new
    # @consumer.variables.build
  end

  def create
    @consumer = Consumer.new(consumer_params)
    if @consumer.save
      redirect_to @consumer
    else
      render 'new'
    end
  end

  def show
    @consumer = Consumer.find(params[:id])
    redirect_to @consumer.service_definition
  end

  def index
    @consumers = Consumer.all
  end

  def edit
    @consumer = Consumer.find(params[:id])
  end


  def update
    @consumer = Consumer.find(params[:id])
    if @consumer.update(consumer_params)
      redirect_to @consumer
    else
      render 'edit'
    end
  end

  def destroy
    @consumer = Consumer.find(params[:id])
    @consumer.destroy
    redirect_to consumers_path
  end

private

  def consumer_params
    params.require(:consumer).permit! #(:name, :comment)
  end

end
