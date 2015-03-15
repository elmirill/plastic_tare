class RemoveProductTypeFromProducts < ActiveRecord::Migration
  def change
  	remove_reference :products, :product_type, index: true
  end
end
