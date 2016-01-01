class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_action :get_types, :get_categories, :get_promo, :create_order_item, :create_comparison_item, :set_price, :set_core_setting
	helper_method :order_item_by_product_id, :product_in_cart?, :tovar_pluralize, :cart_size, :cart_button_text, :current_comparison, :comparison_item_by_product_id, :current_controller?, :current_order, :var_color?, :var_high?, :var_spec?, :var_prices_any?
	

  def get_types
    @types = Type.all
  end
	
	def get_categories
		@categories = Category.all
  end
	
	def get_promo
		@promo = Promo.where(name: "default").first
	end
		
	def current_order
		if session[:order_id].present?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
	
	def current_comparison
    if !session[:comparison_id].nil?
      Comparison.find(session[:comparison_id])
    else
      Comparison.new
    end
  end
	
	def create_order_item
		@new_order_item = current_order.order_items.new
	end
	
	def create_comparison_item
		@new_comparison_item = current_comparison.comparison_items.new
	end
	
	def order_item_by_product_id(product_id)
		current_order.order_items.where(product_id: product_id).first
	end
	
	def comparison_item_by_product_id(product_id)
		current_comparison.comparison_items.where(product_id: product_id).first
	end
	
	def current_controller?(names)
		names.include?(controller_name)
  end
	
	def product_in_cart?(product)
		current_order.order_items.any? { |oi| oi.product_id == product.id }
	end
	
	def tovar_pluralize(num)
		q = num.to_s
		if [11,12,13,14].any? { |e| q[-2, 2].to_i == e } || 
			 [0,5,6,7,8,9].any? { |e| q[-1, 1].to_i == e }
			"товаров"
		elsif q[-1, 1].to_i == 1
			"товар"
		else
			"товара"
		end
	end
	
	def cart_size 
		current_order.order_items.size	
	end
	
	def cart_button_text
		if current_order.total > 0
			"#{cart_size} #{tovar_pluralize(cart_size)}, #{current_order.total}
			<i class='glyphicon glyphicon-ruble'></i>".html_safe
		else
			"#{cart_size} #{tovar_pluralize(cart_size)}"
		end
	end
	
	def set_price
		@price_list = PriceList.find(1)
	end

	def set_core_setting
		@core_setting = CoreSetting.find(1)
	end
	
	def var_color?(product)
		if product.var_color_price_1.present? ||
			 product.var_color_price_2.present? ||
			 product.var_color_price_3.present?
			true
		end
	end
	
	def var_high?(product)
		if product.var_high_price_1.present? ||
			 product.var_high_price_2.present? ||
			 product.var_high_price_3.present?
			true
		end
	end
	
	def var_spec?(product)
		if product.var_spec_price_1.present? ||
			 product.var_spec_price_2.present? ||
			 product.var_spec_price_3.present?
			true
		end
	end

	def var_prices_any?(product)
		if var_color?(product) || var_high?(product) || var_spec?(product)
			true
		end
	end
	
end
