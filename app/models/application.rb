class Application < ActiveRecord::Base
	has_many :product_applications
	has_many :products, through: :product_applications
end
