class AddAttachmentThumbnailToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :products, :thumbnail
  end
end
