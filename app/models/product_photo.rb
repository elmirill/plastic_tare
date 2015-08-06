class ProductPhoto < ActiveRecord::Base
  belongs_to :product
	
	has_attached_file :photo, styles: {
														original: {
															quality: "60",
															format: "JPG"
															},
														thumb: {
															geometry: "500x420>",
															quality: "60",
															format: "JPG"
															}
												},	convert_options: { thumb: "-gravity center -extent 500x420"}, 																		default_url: 'box_menu.png'
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
	validates_attachment_size :photo, { in: 0..3.megabytes }
end
