class BlueprintModulesController < ApplicationController

  def new
    @blueprint_module = BlueprintModule.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @blueprint_module = BlueprintModule.new(blueprint_module_params)
    if @blueprint_module.save
      redirect_to ( url_for( @blueprint_module.blueprint_version ) + '#' + @blueprint_module.class.name.underscore + '_' + @blueprint_module.id.to_s )
    else
      render 'new'
    end
  end

  # def show
  #   @blueprint_module = BlueprintModule.find(params[:id])
  # end

  def edit
    @blueprint_module = BlueprintModule.find(params[:id])
  end

  def update
    @blueprint_module = BlueprintModule.find(params[:id])

    if @blueprint_module.update(blueprint_module_params)
      redirect_to ( url_for( @blueprint_module.blueprint_version ) + '#' + @blueprint_module.class.name.underscore + '_' + @blueprint_module.id.to_s )
    else
      render 'edit'
    end
  end

  def destroy
    @blueprint_module = BlueprintModule.find(params[:id])
    @blueprint_module.destroy
    redirect_to ( url_for( @blueprint_module.blueprint_version ) + '#' + @blueprint_module.class.name.pluralize.underscore )
  end

private

  def blueprint_module_params
    params.require(:blueprint_module).permit!
  end

end
