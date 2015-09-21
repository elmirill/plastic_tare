class AddItemVolToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :item_vol, :decimal, precision: 20, scale: 2
  end
end
