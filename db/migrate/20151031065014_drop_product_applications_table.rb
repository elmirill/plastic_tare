class DropProductApplicationsTable < ActiveRecord::Migration
  def change
		drop_table :product_applications
  end
end
