class ChangeDateTypeForPositionInProducts < ActiveRecord::Migration
  def change
		change_column :products, :position, :integer
  end
end
