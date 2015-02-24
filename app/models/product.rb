class Product < ActiveRecord::Base

	# scope :search, ->(keyword){ where('keywords LIKE ?', "%{keyword.downcase}%") if keyword.present? }
	# scope :filter_kind, ->(kind){ where(kind: kind) } if filter_kind.present?
	# scope :filter_application, ->(applicatin){ where(application: applicatin) }

end
