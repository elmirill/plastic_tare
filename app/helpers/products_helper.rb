module ProductsHelper
	
	def category_types_present?
		Product.filter_category(@curr_cat_id).filter_types(@type_names).present?
	end
	
end
