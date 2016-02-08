class PriceListsController < ApplicationController
	before_action :authenticate_admin!
	
	def edit
  end
	
	def update
		if @price_list.update(price_params)
			redirect_to price_list_path, notice: "Прайс-лист обновлен."
		else
			render price_list_path, alert: "Ошибка. Прайс-лист не обновлен."
		end
  end
	
	private
	
	def price_params
		params.require(:price_list).permit(:price)
	end
end
