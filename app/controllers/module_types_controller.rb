class ModuleTypesController < ApplicationController

  def new
    @module_type = ModuleType.new
  end

  def create
    @module_type = ModuleType.new(module_type_params)
    if @module_type.save
      redirect_to @module_type
    else
      render 'new'
    end
  end

  def show
    @module_type = ModuleType.find(params[:id])
  end

  def index
    @module_types = ModuleType.all
  end

  def edit
    @module_type = ModuleType.find(params[:id])
  end


  def update
    @module_type = ModuleType.find(params[:id])
    if @module_type.update(module_type_params)
      redirect_to @module_type
    else
      render 'edit'
    end
  end

  def destroy
    @module_type = ModuleType.find(params[:id])
    @module_type.destroy
    redirect_to module_types_path
  end

private

  def module_type_params
    params.require(:module_type).permit! #(:name, :comment, :language_id)
  end

end
