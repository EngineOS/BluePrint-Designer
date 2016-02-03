class TargetEnvsController < ApplicationController

  def new
    @target_env = TargetEnv.new(service_definition_id: params[:service_definition_id])
    # @target_env.variables.build
  end

  def create
    @target_env = TargetEnv.new(target_env_params)
    if @target_env.save
      redirect_to @target_env
    else
      render 'new'
    end
  end

  def show
    @target_env = TargetEnv.find(params[:id])
    redirect_to url_for(@target_env.service_definition) + '#target_env_' + @target_env.id.to_s
  end

  def index
    @target_envs = TargetEnv.all
  end

  def edit
    @target_env = TargetEnv.find(params[:id])
  end


  def update
    @target_env = TargetEnv.find(params[:id])
    if @target_env.update(target_env_params)
      redirect_to @target_env
    else
      render 'edit'
    end
  end

  def destroy
    @target_env = TargetEnv.find(params[:id])
    # return_path = url_for(@target_env.service_definition) + '#target_envs'
    @target_env.destroy
    redirect_to url_for(@target_env.service_definition) + '#target_envs'
  end

private

  def target_env_params
    params.require(:target_env).permit! #(:name, :comment)
  end

end
