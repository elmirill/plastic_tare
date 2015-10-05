class PriceList < ActiveRecord::Base
	has_attached_file :price
	validates_attachment :price, content_type: { content_type: ["application/pdf", "application/vnd.ms-excel"] }, size: { less_than: 2.megabytes }
	
end
