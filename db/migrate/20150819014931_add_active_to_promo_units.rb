class AddActiveToPromoUnits < ActiveRecord::Migration
  def change
    add_column :promo_units, :active, :boolean
  end
end
