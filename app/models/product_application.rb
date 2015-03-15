class ProductApplication < ActiveRecord::Base
  belongs_to :product
  belongs_to :application
end
