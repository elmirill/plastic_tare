class AddWeightSideBottomLoadsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :weight, :float
    add_column :products, :side, :string
    add_column :products, :bottom, :string
    add_column :products, :static_load, :integer
    add_column :products, :dynamic_load, :integer
    add_column :products, :rack_load, :integer
  end
end
