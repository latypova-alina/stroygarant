class AddParamTypeToParamValues < ActiveRecord::Migration
  def change
    add_reference :param_values, :param_type, index: true
    add_foreign_key :param_values, :param_types
  end
end
