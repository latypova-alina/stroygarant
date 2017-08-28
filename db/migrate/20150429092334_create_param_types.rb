class CreateParamTypes < ActiveRecord::Migration
  def change
    create_table :param_types do |t|
      t.string :name
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :param_types, :categories
  end
end
