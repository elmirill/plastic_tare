class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_types_and_applications, :get_promo, :create_order_item
	helper_method :current_order
	

  def get_types_and_applications
    @types = Type.all
    @applications = Application.all
  end
	
	def get_promo
		@promo = Promo.where(name: "default").first
	end
	
	def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
	
	def create_order_item
		@order_item = current_order.order_items.new
	end
end
