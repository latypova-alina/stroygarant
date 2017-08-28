class AddUnitsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :units, :string
    add_index :products, :units
  end
end
