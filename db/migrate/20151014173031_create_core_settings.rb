class CreateCoreSettings < ActiveRecord::Migration
  def change
    create_table :core_settings do |t|
      t.string :name
      t.string :main_phone
      t.string :add_phone_1
      t.string :add_phone_2
      t.boolean :main_phone_multi
      t.boolean :add_phone_1_multi
      t.boolean :add_phone_2_multi
      t.string :main_email
      t.string :add_email
      t.text :address
      t.text :address_comment
      t.string :site_description
      t.decimal :map_lat
      t.decimal :map_lng
      t.string :map_name

      t.timestamps null: false
    end
  end
end
