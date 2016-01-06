class Category < ActiveRecord::Base
	has_many :products
	
	has_attached_file :thumbnail
	validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/
end