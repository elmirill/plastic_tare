class Product < ActiveRecord::Base

	before_save :set_keywords

	has_many :product_types
	has_many :types, through: :product_types

	has_many :product_applications
	has_many :applications, through: :product_applications

	belongs_to :category

	scope :filter_category, ->(category_id){where(products: { category_id: category_id }) if category_id.present?}

	scope :filter_type, ->(type_name){
		joins(:types).where(types: { name: type_name }) if type_name.present?
	}
	scope :filter_application, ->(application_name){
		joins(:applications).where(applications: { name: application_name }) if application_name.present?
	}
	scope :search, ->(search){ where('keywords LIKE ?', "%#{search.downcase}%") if search.present? }

	protected
		def set_keywords

			columns = [name, category, color, length, width, height, diameter, inner_length, inner_width, inner_height, inner_diameter, volume, net_volume, weight, side, bottom, types, cover, static_load, dynamic_load, rack_load, capacity, description, var_color_price_1, var_color_price_2, var_color_price_3, var_high_price_1, var_high_price_2, var_high_price_3, var_spec_price_1, var_spec_price_2, var_spec_price_3, applications, articul]

			keywords = name

			columns.each do |column|
				keywords = [keywords, column].join(' ') if column.present?
			end

			self.keywords = keywords.mb_chars.downcase
			
		end

end
