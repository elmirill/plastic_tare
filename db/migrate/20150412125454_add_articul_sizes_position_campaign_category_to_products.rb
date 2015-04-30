class AddArticulSizesPositionCampaignCategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :articul, :string
    add_column :products, :length, :integer
    add_column :products, :width, :integer
    add_column :products, :height, :integer
    add_column :products, :length_with_cover, :integer
    add_column :products, :width_with_cover, :integer
    add_column :products, :height_with_cover, :integer
    add_column :products, :cover_length, :integer
    add_column :products, :cover_width, :integer
    add_column :products, :cover_height, :integer
    add_column :products, :position, :integer
    add_column :products, :campaign, :integer
    add_column :products, :category, :string
  end
end
