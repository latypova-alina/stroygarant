class CreateProductParams < ActiveRecord::Migration
  def change
    create_table :product_params do |t|
      t.references :product, index: true
      t.references :param_type, index: true
      t.references :param_value, index: true

      t.timestamps null: false
    end
    add_foreign_key :product_params, :products
    add_foreign_key :product_params, :param_types
    add_foreign_key :product_params, :param_values
  end
end
