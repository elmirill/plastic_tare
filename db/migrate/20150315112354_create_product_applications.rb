class CreateProductApplications < ActiveRecord::Migration
  def change
    create_table :product_applications do |t|
      t.references :product, index: true
      t.references :application, index: true

      t.timestamps null: false
    end
  end
end
