class CreateParams < ActiveRecord::Migration
  def change
    create_table :params do |t|
      t.string :name
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :params, :categories
  end
end
