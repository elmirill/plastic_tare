class AddTypeToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :type, index: true
  end
end
