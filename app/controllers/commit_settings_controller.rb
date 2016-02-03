class CommitSettingsController < ApplicationController

  before_action :authenticate_user!

  def show
    @commit_settings = CommitSettings.instance
  end

  def edit
    @commit_settings = CommitSettings.instance
  end

  def update
    @commit_settings = CommitSettings.instance
    if @commit_settings.update(commit_settings_params)
      redirect_to commit_setting_path
    else
      render 'edit'
    end
  end

private

  def commit_settings_params
    params.require(:commit_settings).permit!
  end

end
