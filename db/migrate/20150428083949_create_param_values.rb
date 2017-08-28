class CreateParamValues < ActiveRecord::Migration
  def change
    create_table :param_values do |t|
      t.string :name
      t.references :param, index: true

      t.timestamps null: false
    end
    add_foreign_key :param_values, :params
  end
end
