class AddDeliveryPointIdToOrder < ActiveRecord::Migration
    def change
        add_column :orders, :delivery_point_id, :integer
    end
end
