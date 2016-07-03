class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.references :product, index: true
      t.references :type, index: true

      t.timestamps null: false
    end
  end
end
