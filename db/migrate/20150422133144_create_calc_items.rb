class CreateCalcItems < ActiveRecord::Migration
  def change
    create_table :calc_items do |t|
      t.string :name
      t.string :price

      t.timestamps null: false
    end
  end
end
