class AddItemTotalToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :item_total, :float
  end
end
