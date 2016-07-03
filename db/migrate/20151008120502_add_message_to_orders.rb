class AddMessageToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :customer_message, :text
  end
end
