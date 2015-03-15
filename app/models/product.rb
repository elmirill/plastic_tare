class Product < ActiveRecord::Base

	before_save :set_keywords

	has_many :product_types
	has_many :types, through: :product_types

	has_many :product_applications
	has_many :applications, through: :product_applications

	scope :filter_type, ->(type_name){
		joins(:types).where(types: { name: type_name }) if type_name.present?
	}
	scope :filter_application, ->(application_name){
		joins(:applications).where(applications: { name: application_name }) if application_name.present?
	}
	scope :search, ->(search){ where('keywords LIKE ?', "%#{search.downcase}%") if search.present? }

	protected
		def set_keywords
			# self.keywords = [name, description, short_description, size, size_with_cover, cover_size, capacity, volume, net_volume, parameter, color, var_color_price_1, var_color_price_2, var_color_price_3, var_high_price_1, var_high_price_2, var_high_price_3, var_spec_price_1, var_spec_price_2, var_spec_price_3].map(&:downcase).join(' ')
			self.keywords = [name, short_description].map { |w| w.mb_chars.downcase }.join(' ')
		end

end
