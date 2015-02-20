class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :address_full
      t.text :address_short
      t.string :email
      t.string :phone_main
      t.string :phone_other
      t.string :map

      t.timestamps null: false
    end
  end
end
