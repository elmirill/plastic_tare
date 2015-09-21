class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_action :get_types_and_applications, :get_promo, :create_order_item
	helper_method :current_order, :order_item_by_product_id, :product_in_cart?
	

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
	
	def create_order_item
		@new_order_item = current_order.order_items.new
	end
	
	def order_item_by_product_id(product)
		OrderItem.where(product_id: product).first
	end
	
	def product_in_cart?(product)
		current_order.order_items.any? { |oi| oi.product_id == product.id }
	end
	
	def tovar_pluralize(num)
		
	end
end
