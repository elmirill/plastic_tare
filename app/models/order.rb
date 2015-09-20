class Order < ActiveRecord::Base
	has_many :order_items
	before_save :update_total
	
	def total
		order_items.collect { |order_item| order_item.valid? ? (order_item.total_price) : 0 }.sum
	end
	
	private
	
	def update_total
		self[:total] = total
	end
end


