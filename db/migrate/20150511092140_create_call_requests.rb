class CreateCallRequests < ActiveRecord::Migration
  def change
    create_table :call_requests do |t|
      t.string :name
      t.string :phone

      t.timestamps null: false
    end
  end
end
