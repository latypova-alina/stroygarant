class AddPositionToCalcItems < ActiveRecord::Migration
  def change
    add_column :calc_items, :position, :integer
    add_index :calc_items, :position
  end
end
