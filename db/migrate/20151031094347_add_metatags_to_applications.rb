class AddMetatagsToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :meta_title, :string
    add_column :applications, :meta_description, :string
  end
end
