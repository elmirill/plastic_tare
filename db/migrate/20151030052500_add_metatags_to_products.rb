class AddMetatagsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :meta_title, :string
    add_column :products, :meta_description, :string
  end
end
