class AddAncestryToCalcItems < ActiveRecord::Migration
  def change
    add_column :calc_items, :ancestry, :string
    add_index :calc_items, :ancestry
  end
end
