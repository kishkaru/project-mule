class RemoveAddressFromVendors < ActiveRecord::Migration
  def up
    remove_column :vendors, :address
  end

  def down
    add_column :vendors, :address, :string
  end
end
