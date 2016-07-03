class RemovePricesBooleansFromProducts < ActiveRecord::Migration
  def change
		remove_column :products, :var_color
		remove_column :products, :var_high
		remove_column :products, :var_spec
  end
end
