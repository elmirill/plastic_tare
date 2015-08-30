class PromosController < ApplicationController
  before_action :set_promo
	before_action :authenticate_admin!

  def edit
  end

  def update
    respond_to do |format|
      if @promo.update(promo_params)
        format.html { redirect_to root_path }
        format.json { render :show, status: :ok, location: @promo }
      else
        format.html { render :edit }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promo
			@promo = Promo.where(name: "default").first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promo_params
			params.require(:promo).permit(:name, promo_units_attributes: [:id, :title, :subtitle, :link, :description, :image, :promo_id, :active, :_destroy])
    end
end
