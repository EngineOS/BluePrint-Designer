class ReplacementStringsController < ApplicationController

  def new
    @replacement_string = ReplacementString.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @replacement_string = ReplacementString.new(replacement_string_params)
    if @replacement_string.save
      redirect_to @replacement_string
    else
      render 'new'
    end
  end

  def show
    @replacement_string = ReplacementString.find(params[:id])
  end

  def edit
    @replacement_string = ReplacementString.find(params[:id])
  end

  def update
    @replacement_string = ReplacementString.find(params[:id])

    if @replacement_string.update(replacement_string_params)
      redirect_to @replacement_string
    else
      render 'edit'
    end
  end

  def destroy
    @replacement_string = ReplacementString.find(params[:id])
    @replacement_string.destroy
    redirect_to @replacement_string.blueprint_version
  end

private

  def replacement_string_params
    params.require(:replacement_string).permit!
  end

end
