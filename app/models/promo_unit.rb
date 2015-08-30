class PromoUnit < ActiveRecord::Base
  belongs_to :promo
	
	has_attached_file :image,
						styles: {
							original: {
								geometry: "300x300>",
								format: "PNG"
								}
							},
						convert_options: { original: "-gravity center -extent 300x300"},
						source_file_options: { all: '-background transparent' }
	
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_attachment_size :image, { in: 0..1.megabytes }
end
