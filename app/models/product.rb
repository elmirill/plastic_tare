class Product < ActiveRecord::Base
	has_many :product_types
	has_many :types, through: :product_types

	has_many :product_applications
	has_many :applications, through: :product_applications
end
