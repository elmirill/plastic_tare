class AddDefaultMetatagsToCoreSettings < ActiveRecord::Migration
  def change
    add_column :core_settings, :default_meta_title, :string
    add_column :core_settings, :default_meta_description, :string
  end
end
