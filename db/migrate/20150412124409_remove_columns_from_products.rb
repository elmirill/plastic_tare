class RemoveColumnsFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :short_description
  	remove_column :products, :size
  	remove_column :products, :size_with_cover
  	remove_column :products, :cover_size
  end
end
