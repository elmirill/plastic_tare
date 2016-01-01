class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
	
	validates_uniqueness_of :product_id, scope: :order_id
	validate :product_present?
	validate :order_present?
	
	before_save :finalize
	
	def total_price
		color_price = var_color?(product) ? self.var_price("color") : 0
		high_price = var_high?(product) ? self.var_price("high") : 0
		spec_price = var_spec?(product) ? self.var_price("spec") : 0
		total_price = color_quantity * color_price + high_quantity * high_price + spec_quantity * spec_price
		total_price.to_i
	end
	
	def item_vol
		((color_quantity + high_quantity + spec_quantity) *  (product.length * product.width * product.height) / 1000000000.00).round(2)
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
	
	def var_color?(product)
		if product.var_color_price_1.present? ||
			 product.var_color_price_2.present? ||
			 product.var_color_price_3.present?
			true
		end
	end
	
	def var_high?(product)
		if product.var_high_price_1.present? ||
			 product.var_high_price_2.present? ||
			 product.var_high_price_3.present?
			true
		end
	end
	
	def var_spec?(product)
		if product.var_spec_price_1.present? ||
			 product.var_spec_price_2.present? ||
			 product.var_spec_price_3.present?
			true
		end
	end
	
	private
	
	def product_present?
		if product.nil? || !product.active?
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
		self[:item_vol] = item_vol
	end
end

