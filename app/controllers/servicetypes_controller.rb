class ServicetypesController < ApplicationController
  
  def new
           @servicetype = Servicetype.new
          end
  
          def create
           @servicetype = Servicetype.new(servicetype_params)
  
                  if @servicetype.save
                          redirect_to @servicetype
                  else
                          render 'new'
                  end
  
          end
  
          def show
            @servicetype = Servicetype.find(params[:id])
          end
  
          def index
           @servicetypes = Servicetype.all
          end
  
          def edit
           @servicetype = Servicetype.find(params[:id])
          end
  
  
          def update
           @servicetype = Servicetype.find(params[:id])
  
                  if @servicetype.update(servicetype_params)
                          redirect_to @servicetype
                  else
                          render 'edit'
                  end
          end
  
          def destroy
            @servicetype = Servicetype.find(params[:id])
            @servicetype.destroy
  
            redirect_to servicetypes_path
          end
  
  private
    def servicetype_params
      params.require(:servicetype).permit(:name, :comment)
  end

end
