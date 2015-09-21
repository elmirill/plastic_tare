class Order < ActiveRecord::Base
	has_many :order_items
	before_save :update_total
	
	def total
		order_items.collect { |order_item| order_item.valid? ? (order_item.total_price) : 0 }.sum
	end
	
	def total_vol
		order_items.collect { |order_item| order_item.valid? ? (order_item.item_vol) : 0 }.sum.round(2)
	end
	
	private
	
	def update_total
		self[:total] = total
		self[:total_vol] = total_vol
	end
end


