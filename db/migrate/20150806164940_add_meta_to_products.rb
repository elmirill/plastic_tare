class AddMetaToProducts < ActiveRecord::Migration
  def change
    add_column :products, :meta, :text
  end
end
