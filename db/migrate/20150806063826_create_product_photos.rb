class CreateProductPhotos < ActiveRecord::Migration
  def change
    create_table :product_photos do |t|
      t.string :caption
      t.belongs_to :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :product_photos, :products
  end
end
