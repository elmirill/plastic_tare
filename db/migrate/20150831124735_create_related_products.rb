class CreateRelatedProducts < ActiveRecord::Migration
  def change
    create_table :related_products do |t|
      t.integer :product_id
      t.integer :related_product_id

      t.timestamps null: false
    end
  end
end
