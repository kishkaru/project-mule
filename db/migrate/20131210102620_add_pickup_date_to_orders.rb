class AddPickupDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pickup_date, :datetime
  end
end
