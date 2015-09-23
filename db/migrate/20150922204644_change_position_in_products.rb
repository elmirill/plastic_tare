class ChangePositionInProducts < ActiveRecord::Migration
  def change
		change_column :products, :position, :float
  end
end
