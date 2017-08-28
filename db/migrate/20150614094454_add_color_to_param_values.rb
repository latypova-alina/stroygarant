class AddColorToParamValues < ActiveRecord::Migration
  def change
    add_column :param_values, :color, :string
  end
end
