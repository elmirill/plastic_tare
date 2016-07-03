class RemoveIconFromCategories < ActiveRecord::Migration
  def change
		remove_column :categories, :icon
  end
end
