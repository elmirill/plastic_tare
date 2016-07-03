class AddAttachmentPhotoToProductPhotos < ActiveRecord::Migration
  def self.up
    change_table :product_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :product_photos, :photo
  end
end
