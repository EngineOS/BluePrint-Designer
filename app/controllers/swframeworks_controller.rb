class SwframeworksController < ApplicationController
  def new
           @swframework = Swframework.new
          end
  
          def create
           @swframework = Swframework.new(swframework_params)
  
                  if @swframework.save
                          redirect_to @swframework
                  else
                          render 'new'
                  end
  
          end
  
          def show
            @swframework = Swframework.find(params[:id])
          end
  
          def index
           @swframeworks = Swframework.all
          end
  
          def edit
           @swframework = Swframework.find(params[:id])
          end
  
  
          def update
           @swframework = Swframework.find(params[:id])
  
                  if @swframework.update(swframework_params)
                          redirect_to @swframework
                  else
                          render 'edit'
                  end
          end
  
          def destroy
            @swframework = Swframework.find(params[:id])
            @swframework.destroy
  
            redirect_to swframework_path
          end
  
  private
    def swframework_params
      params.require(:swframework).permit(:name, :langauge_id, :description)
  end

end
