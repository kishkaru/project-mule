class AddPickupPointIdToUsers < ActiveRecord::Migration
    def change
        add_column :users, :pickup_point_id, :integer
    end
end
