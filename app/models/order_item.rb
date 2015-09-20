class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
	
	validate :any_quantity_present?
	validate :product_present?
	validate :order_present?
	
	before_save :finalize
	
	def total_price
		color_price = product.var_color? ? self.var_price("color") : 0
		high_price = product.var_high? ? self.var_price("high") : 0
		spec_price = product.var_spec? ? self.var_price("spec") : 0
		total_price = color_quantity * color_price + high_quantity * high_price + spec_quantity * spec_price
	end
	
	def var_price(var)
		if product.send("var_#{var}_price_1") * self.send("#{var}_quantity") > 50000
			if product.send("var_#{var}_price_2") * self.send("#{var}_quantity") > 300000
					product.send("var_#{var}_price_3")
			else
					product.send("var_#{var}_price_2")
			end
		else
				product.send("var_#{var}_price_1")
		end
	end
	
	private

	def any_quantity_present?
		unless %w(color_quantity high_quantity spec_quantity).all? { |attrmatch| 
		(self[attrmatch].is_a? Integer) || self[attrmatch].nil? || self[attrmatch] == 0 }
			unless %w(color_quantity high_quantity spec_quantity).any? { |attrabove|
			self[attrabove] > 0 }
				errors.add :base, "Укажите корректное количество."
			end
		end
	end
	
	def product_present?
		if product.nil?
			errors.add(:product, "невалиден или неактивен.")
		end
	end
	
	def order_present?
		if order.nil?
			errors.add(:order, "невалиден.")
		end
	end
	
	def finalize
		self[:item_total] = total_price
	end
end
