class AddPositionToParamTypes < ActiveRecord::Migration
  def change
    add_column :param_types, :position, :integer
    add_index :param_types, :position
  end
end
