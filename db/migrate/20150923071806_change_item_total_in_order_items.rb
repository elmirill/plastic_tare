class ChangeItemTotalInOrderItems < ActiveRecord::Migration
  def change
		change_column :order_items, :item_total, :integer
  end
end 
