class OrderItemsController < ApplicationController
	before_action :set_order
	before_action :set_order_item, only: [:update, :destroy]
	
  def create
		@order_item = @order.order_items.new(order_item_params)
    @order.save
		session[:order_id] = @order.id
  end
	
	def edit
	end

  def update
		@order_item.update_attributes(order_item_params)
    @order_items = @order.order_items.order(params.fetch(:sort, "created_at ASC"))
  end

  def destroy
		@order_item.destroy
		@order_items = @order.order_items.order(params.fetch(:sort, "created_at ASC"))
  end
	
	private
	
	def set_order
		@order = current_order
	end
	
	def set_order_item
		@order_item = @order.order_items.find(params[:id])
	end
	
	def order_item_params 
		params.require(:order_item).permit(:color_quantity, :high_quantity, :spec_quantity, :product_id)
	end
	
end
