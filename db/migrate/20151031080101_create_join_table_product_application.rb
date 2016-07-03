class CreateJoinTableProductApplication < ActiveRecord::Migration
  def change
    create_join_table :products, :applications do |t|
      # t.index [:product_id, :application_id]
      # t.index [:application_id, :product_id]
    end
  end
end
