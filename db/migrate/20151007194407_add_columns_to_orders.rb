class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :customer_name, :string
    add_column :orders, :customer_contact, :string
  end
end
