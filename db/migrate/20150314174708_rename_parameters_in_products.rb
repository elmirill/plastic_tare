class RenameParametersInProducts < ActiveRecord::Migration
  def change
  	rename_column :products, :parameters, :parameter
  end
end
