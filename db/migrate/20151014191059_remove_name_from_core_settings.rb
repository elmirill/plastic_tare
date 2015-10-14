class RemoveNameFromCoreSettings < ActiveRecord::Migration
  def change
		remove_column :core_settings, :name
  end
end
