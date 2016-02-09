class TypeConsumersController < ApplicationController

  # def new
  #   @type_consumer = TypeConsumer.new(accept_id: params[:accept_id])
  # end
  #
  # def create
  #   @type_consumer = TypeConsumer.new(type_consumer_params)
  #   if @type_consumer.save
  #     redirect_to @type_consumer
  #   else
  #     render 'new'
  #   end
  # end

  def show
    @type_consumer = TypeConsumer.find(params[:id])
    redirect_to @type_consumer.accept
  end
  #
  # def index
  #   @type_consumers = TypeConsumer.all
  # end

  # def edit
  #   @type_consumer = TypeConsumer.find(params[:id])
  # end
  #
  #
  # def update
  #   @type_consumer = TypeConsumer.find(params[:id])
  #   if @type_consumer.update(type_consumer_params)
  #     redirect_to @type_consumer
  #   else
  #     render 'edit'
  #   end
  # end
  #
  # def destroy
  #   @type_consumer = TypeConsumer.find(params[:id])
  #   @type_consumer.destroy
  #   redirect_to url_for(@type_consumer.accept) + '#type_consumers'
  # end

private

  def type_consumer_params
    params.require(:type_consumer).permit! #(:name, :comment)
  end

end
