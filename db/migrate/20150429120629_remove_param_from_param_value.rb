class RemoveParamFromParamValue < ActiveRecord::Migration
  def change
    remove_column :param_values, :param_id
  end
end
