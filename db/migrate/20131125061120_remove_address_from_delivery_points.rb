class RemoveAddressFromDeliveryPoints < ActiveRecord::Migration
  def up
  	remove_column :delivery_points, :address
  end

  def down
  	add_column :delivery_points, :address, :string
  end
end
