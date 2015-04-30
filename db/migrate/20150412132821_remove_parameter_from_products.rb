class RemoveParameterFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :parameter
  end
end
