class RenameProductTypesTable < ActiveRecord::Migration
  def change
  	rename_table :product_types, :types
  end
end
