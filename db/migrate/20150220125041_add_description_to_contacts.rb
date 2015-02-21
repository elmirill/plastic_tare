class AddDescriptionToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :description, :string
  end
end
