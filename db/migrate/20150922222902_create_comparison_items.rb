class CreateComparisonItems < ActiveRecord::Migration
  def change
    create_table :comparison_items do |t|
      t.references :product, index: true
      t.references :comparison, index: true

      t.timestamps null: false
    end
    add_foreign_key :comparison_items, :products
    add_foreign_key :comparison_items, :comparisons
  end
end
