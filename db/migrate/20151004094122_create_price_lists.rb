class CreatePriceLists < ActiveRecord::Migration
  def change
    create_table :price_lists do |t|

      t.timestamps null: false
    end
  end
end
