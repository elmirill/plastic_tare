class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :short_description
      t.string :gallery
      t.string :size
      t.string :size_with_cover
      t.string :cover_size
      t.string :capacity
      t.integer :volume
      t.integer :net_volume
      t.string :parameters
      t.string :color
      t.boolean :var_color
      t.integer :var_color_price_1
      t.integer :var_color_price_2
      t.integer :var_color_price_3
      t.boolean :var_high
      t.integer :var_high_price_1
      t.integer :var_high_price_2
      t.integer :var_high_price_3
      t.boolean :var_spec
      t.integer :var_spec_price_1
      t.integer :var_spec_price_2
      t.integer :var_spec_price_3
      t.boolean :featured

      t.timestamps null: false
    end
  end
end
