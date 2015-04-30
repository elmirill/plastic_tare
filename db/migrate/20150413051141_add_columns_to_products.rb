class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :inner_length, :integer
    add_column :products, :inner_width, :integer
    add_column :products, :inner_height, :integer
    add_column :products, :cover, :boolean
  end
end
