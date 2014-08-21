class LangaugesController < ApplicationController

  def new
         @langauge = Langauge.new
        end

        def create
         @langauge = Langauge.new(langauge_params)

                if @langauge.save
                        redirect_to @langauge
                else
                        render 'new'
                end
        end

        def show
          @langauge = Langauge.find(params[:id])
        end

        def index
         @langauges = Langauge.all
        end

        def edit
         @langauge = Langauge.find(params[:id])
        end


        def update
         @langauge = Langauge.find(params[:id])

                if @langauge.update(langauge_params)
                        redirect_to @langauge
                else
                        render 'edit'
                end
        end

        def destroy
          @langauge = Langauge.find(params[:id])
          @langauge.destroy

          redirect_to langauges_path
        end

private
  def langauge_params
    params.require(:langauge).permit(:name, :comment)
end


end
