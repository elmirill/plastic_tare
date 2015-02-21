class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :gallery
      t.string :kind
      t.string :application
      t.string :size
      t.string :capacity
      t.integer :volume
      t.string :parameter
      t.string :color
      t.boolean :color_var
      t.integer :color_var_price_1
      t.integer :color_var_price_2
      t.integer :color_var_price_3
      t.boolean :high_var
      t.integer :high_var_price_1
      t.integer :high_var_price_2
      t.integer :high_var_price_3
      t.boolean :spec_var
      t.integer :spec_var_price_1
      t.integer :spec_var_price_2
      t.integer :spec_var_price_3

      t.timestamps null: false
    end
  end
end
