class ComparisonItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :comparison
	
	validate :product_present
  validate :comparison_present
	validate :max_amount
	
	private
  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def comparison_present
    if comparison.nil?
      errors.add(:comparison, "is not a valid comparison.")
    end
  end
	
	def max_amount
		errors.add(:base, "too much comparison items") if comparison.comparison_items.size > 3
	end
	
end
