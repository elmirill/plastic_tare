class OrdersController < ApplicationController
	before_action :set_order
	
  def show
		@order_items = @order.order_items.order(params.fetch(:sort, "created_at ASC"))
  end
	
	def empty
		OrderItem.where(order_id: @order.id).delete_all
		@order.customer_name = nil
		@order.customer_contact = nil
		@order.customer_message = nil
		@order.save!
		flash[:notice] = "Корзина очищена"
		redirect_to order_path
	end
	
	def edit
	end
	
	def update
		@to = @core_setting.main_email
		if @order.update(order_params)
			if CartMailer.send_cart_contents(@order, @to).deliver
				redirect_to :back, notice: 'Заказ отправлен.'
			else
				flash.now[:alert] = 'Ошибка! Заказ не отправлен.'
				render :cart
			end
		else
			flash.now[:alert] = 'Ошибка! Заказ не сохранен.'
			render :cart
		end
	end
	
	private
	
	def set_order
		@order = current_order
	end
	
	def order_params
		params.require(:order).permit(:customer_name, :customer_contact, :customer_message)
	end
end