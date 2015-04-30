class AddDiameterToProducts < ActiveRecord::Migration
  def change
    add_column :products, :diameter, :integer
    add_column :products, :inner_diameter, :integer
  end
end
