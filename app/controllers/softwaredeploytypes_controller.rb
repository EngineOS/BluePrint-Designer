class SoftwaredeploytypesController < ApplicationController

  def new
         @softwaredeploytype = Softwaredeploytype.new
        end

        def create
         @softwaredeploytype = Softwaredeploytype.new(softwaredeploytype_params)

                if @softwaredeploytype.save
                        redirect_to @softwaredeploytype
                else
                        render 'new'
                end

        end

        def show
          @softwaredeploytype = Softwaredeploytype.find(params[:id])
        end

        def index
         @softwaredeploytypes = Softwaredeploytype.all
        end

        def edit
         @softwaredeploytype = Softwaredeploytype.find(params[:id])
        end


        def update
         @softwaredeploytype = Softwaredeploytype.find(params[:id])

                if @softwaredeploytype.update(softwaredeploytype_params)
                        redirect_to @softwaredeploytype
                else
                        render 'edit'
                end
        end

        def destroy
          @softwaredeploytype = Softwaredeploytype.find(params[:id])
          @softwaredeploytype.destroy

          redirect_to softwaredeploytypes_path
        end

private
  def softwaredeploytype_params
    params.require(:softwaredeploytype).permit(:name, :comment)
end

end
