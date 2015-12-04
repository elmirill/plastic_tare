class Product < ActiveRecord::Base
	attr_accessor :delete_thumbnail
	before_validation { thumbnail.clear if delete_thumbnail == '1' }
	before_save :set_keywords, :set_min_price
	validates :name, presence: true, uniqueness: true
	
	has_attached_file :thumbnail, styles: {
														thumb: {
															geometry: "250x210>",
															quality: "80",
															format: "JPG"
														},
														original: {
															geometry: "1000x1000>",
															quality: "60",
															format: "JPG"
														}
													}, convert_options: { thumb: "-gravity center -extent 250x210"}, 																default_url: 'box_menu.png'
	validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/
	
	# Set positions
	def self.order(ids)
		if ids.present?
			update_all(["position = STRPOS(?, ','||id||',')", ",#{ids.join(',')},"])
		end
	end

	# Relationships 
	has_many :product_types
	has_many :types, through: :product_types
	
	has_and_belongs_to_many :applications
	
	has_many :product_photos, dependent: :delete_all
	
	has_many :related_product_associations, class_name: "RelatedProduct"
	has_many :related_products, through: :related_product_associations, source: :related_product
	
	has_many :order_items, dependent: :delete_all
	has_many :comparison_items, dependent: :delete_all

	belongs_to :category
	
	accepts_nested_attributes_for :types, reject_if: :all_blank
	accepts_nested_attributes_for :product_photos, reject_if: :all_blank, allow_destroy: true

	# Scopes
	scope :search, ->(search){ where('keywords LIKE ?', "%#{search.mb_chars.downcase}%") if search.present? }
	
	scope :filter_category, ->(category_id){where(products: { category_id: category_id }) if category_id.present?}
	
	scope :filter_types, ->(types){ 
		joins(:types).where(types: { name: types }).distinct.group('products.id').having('count(*) = ?', types.each.count) if types.present?
		} 

	scope :filter_volume, ->(minvol, maxvol){where(products: { volume: minvol..maxvol }) if minvol.present? && maxvol.present? }
	scope :filter_length, ->(minlen, maxlen){where(products: { length: minlen..maxlen }) if minlen.present? && maxlen.present? }
	scope :filter_width, ->(minwid, maxwid){where(products: { width: minwid..maxwid }) if minwid.present? && maxwid.present? }
	scope :filter_height, ->(minheig, maxheig){where(products: { height: minheig..maxheig }) if minheig.present? && maxheig.present? }
	scope :filter_diameter, ->(mindiam, maxdiam){where(products: { diameter: mindiam..maxdiam }) if mindiam.present? && maxdiam.present? }
	scope :filter_cover, ->(cover){where(products: { cover: true }) if cover.present? }
	

	private
	
	def set_keywords
#			columns = [name, category, color, length, width, height, diameter, inner_length, inner_width, inner_height, inner_diameter, volume, net_volume, weight, side, bottom, types, cover, static_load, dynamic_load, rack_load, capacity, description, var_color_price_1, var_color_price_2, var_color_price_3, var_high_price_1, var_high_price_2, var_high_price_3, var_spec_price_1, var_spec_price_2, var_spec_price_3, applications, articul]
		columns = [name, meta]

		keywords = name
		columns.each do |column|
			keywords = [keywords, column].join(' ') if column.present?
		end
		self.keywords = keywords.mb_chars.downcase
	end
	
	def set_min_price
		prices = []
		prices << var_color_price_1 if var_color_price_1.present?
		prices << var_color_price_2 if var_color_price_2.present?
		prices << var_color_price_3 if var_color_price_3.present?
		prices << var_high_price_1 if var_high_price_1.present?
		prices << var_high_price_2 if var_high_price_2.present?
		prices << var_high_price_3 if var_high_price_3.present?
		prices << var_spec_price_1 if var_spec_price_1.present?
		prices << var_spec_price_2 if var_spec_price_2.present?
		prices << var_spec_price_3 if var_spec_price_3.present?
		self.min_price = prices.min
	end

end