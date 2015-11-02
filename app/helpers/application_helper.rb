module ApplicationHelper
	
	def meta_title(meta_title = nil)
		if meta_title.present?
			content_for :meta_title, meta_title
		else
			content_for?(:meta_title) ? content_for(:meta_title) + ' | ' + @core_setting.default_meta_title : @core_setting.default_meta_title
		end
	end
	
	def meta_description(meta_description = nil)
		if meta_description.present?
			content_for :meta_description, meta_description
		else
			content_for?(:meta_description) ? content_for(:meta_description) : @core_setting.default_meta_description
		end
	end
	
	def class_for_current_page(path)
		"active" if request.path == path
	end
	
	def unit_active?
		@promo.promo_units.detect do |unit|
			unit.active?
		end
	end

end
