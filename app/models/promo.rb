class Promo < ActiveRecord::Base
	has_many :promo_units
	
	accepts_nested_attributes_for :promo_units, reject_if: :all_blank, allow_destroy: true
end
