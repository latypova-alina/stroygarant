class AddVendorToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :vendor, index: true
    add_foreign_key :products, :vendors
  end
end
