module ApplicationHelper
	
	def meta_title(meta_title = nil)
		if meta_title.present?
			content_for :meta_title, meta_title
		else
			content_for?(:meta_title) ? content_for(:meta_title) + ' | ' + ENV['default_meta_title'] : ENV['default_meta_title']
		end
	end
	
	def meta_description(meta_description = nil)
		if meta_description.present?
			content_for :meta_description, meta_description
		else
			content_for?(:meta_description) ? content_for(:meta_description) : ENV['default_meta_description']
		end
	end

end
