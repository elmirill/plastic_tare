module PromosHelper
	
	def unit_active?
		@promo.promo_units.detect do |unit|
			unit.active?
		end
	end

end
