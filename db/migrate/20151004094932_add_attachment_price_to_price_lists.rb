class AddAttachmentPriceToPriceLists < ActiveRecord::Migration
  def self.up
    change_table :price_lists do |t|
      t.attachment :price
    end
  end

  def self.down
    remove_attachment :price_lists, :price
  end
end
