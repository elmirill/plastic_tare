class CreatePromoUnits < ActiveRecord::Migration
  def change
    create_table :promo_units do |t|
      t.string :title
      t.string :subtitle
      t.string :link
      t.text :description
      t.belongs_to :promo, index: true

      t.timestamps null: false
    end
    add_foreign_key :promo_units, :promos
  end
end
