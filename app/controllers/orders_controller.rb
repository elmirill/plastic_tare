class OrdersController < ApplicationController
	before_action :set_order
	
  def show
		@order_items = @order.order_items.order(params.fetch(:sort, "created_at ASC"))
		respond_to do |format|
			format.html
			format.pdf do 
				pdf = OrderPdf.new(@order)
				send_data pdf.render,
				filename: "order_#{Time.now.strftime("%d.%m.%Y")}.pdf",
				type: 'application/pdf'
			end
		end
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
		@order.update(order_params)
	end
	
	def send_order_email
		@to = @core_setting.main_email
		if CartMailer.send_cart_contents(@order, @to).deliver
			redirect_to :back, notice: 'Заказ отправлен.'
		else
			flash.now[:alert] = 'Ошибка! Заказ не отправлен.'
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