class RemoveColumnsAgainFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :length_with_cover
  	remove_column :products, :width_with_cover
  	remove_column :products, :height_with_cover
  	remove_column :products, :cover_length
  	remove_column :products, :cover_width
  	remove_column :products, :cover_height
  	remove_column :products, :category
  end
end
