class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
