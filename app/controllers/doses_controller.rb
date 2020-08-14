class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.create(dose_params)
      redirect_to cocktails_path, notice: 'Dose was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_dose
      @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:name)
  end

end
