class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_action :get_types_and_applications, :get_promo, :create_order_item, :create_comparison_item, :set_price, :set_contact_form, :set_core_setting
	helper_method :current_order, :order_item_by_product_id, :product_in_cart?, :tovar_pluralize, :cart_size, :cart_button_text, :current_comparison, :comparison_item_by_product_id
	

  def get_types_and_applications
    @types = Type.all
    @applications = Application.all
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
	
	def order_item_by_product_id(product)
		OrderItem.where(product_id: product).first
	end
	
	def comparison_item_by_product_id(product)
		ComparisonItem.where(product_id: product).first
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

	def set_contact_form
		@contact_form = ContactForm.new
  end

	def set_core_setting
		@core_setting = CoreSetting.find(1) if CoreSetting.find(1).present?
	end
	
end
