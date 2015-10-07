class CartsController < ApplicationController
  def show
		@order_items = current_order.order_items.order(params.fetch(:sort, "created_at ASC"))
  end
	
	def empty
		OrderItem.where(order_id: current_order.id).delete_all
		flash[:notice] = "Корзина очищена"
		redirect_to cart_path
	end
	
	def mail_cart
		@order = current_order
		if CartMailer.send_cart_contents(@order).deliver
			redirect_to :back, notice: 'Заказ отправлен.'
		else
			flash.now[:alert] = 'Ошибка! Заказ не отправлен.'
			render :cart
		end
	end
end