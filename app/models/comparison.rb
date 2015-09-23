class Comparison < ActiveRecord::Base
	has_many :comparison_items, dependent: :delete_all
end
