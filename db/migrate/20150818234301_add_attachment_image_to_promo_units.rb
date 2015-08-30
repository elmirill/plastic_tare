class AddAttachmentImageToPromoUnits < ActiveRecord::Migration
  def self.up
    change_table :promo_units do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :promo_units, :image
  end
end
