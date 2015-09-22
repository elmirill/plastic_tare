class CartsController < ApplicationController
  def show
		@order_items = current_order.order_items.order("created_at ASC")
  end
	
	def empty
		OrderItem.where(order_id: current_order.id).delete_all
		flash[:notice] = "Корзина очищена"
		redirect_to cart_path
	end
end
