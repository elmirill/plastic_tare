class AddTotalVolToOrders < ActiveRecord::Migration
  def change
		add_column :orders, :total_vol, :decimal, precision: 20, scale: 2
  end
end
