class AddPositionToParamValues < ActiveRecord::Migration
  def change
    add_column :param_values, :position, :integer
    add_index :param_values, :position
  end
end
