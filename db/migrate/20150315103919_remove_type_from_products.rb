class RemoveTypeFromProducts < ActiveRecord::Migration
  def change
  	remove_index :products, :type_id
  	remove_column :products, :type_id
  end
end
