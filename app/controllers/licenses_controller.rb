class LicensesController < ApplicationController
  def new
           @license = License.new
          end
  
          def create
           @license = License.new(license_params)
  
                  if @license.save
                          redirect_to @license
                  else
                          render 'new'
                  end
  
          end
  
          def show
            @license = License.find(params[:id])
          end
  
          def index
           @licenses = License.all
          end
  
          def edit
           @license = License.find(params[:id])
          end
  
  
          def update
           @license = License.find(params[:id])
  
                  if @license.update(license_params)
                          redirect_to @license
                  else
                          render 'edit'
                  end
          end
  
          def destroy
            @license = License.find(params[:id])
            @license.destroy
  
            redirect_to licenses_path
          end
  
  private
    def license_params
      params.require(:license).permit(:name, :comment, :sourceurl)
  end

end
