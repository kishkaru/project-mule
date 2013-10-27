class CreateDeliveryAreas < ActiveRecord::Migration
    def change
        create_table :delivery_areas do |t|
            t.string :name
            t.references :server
            t.references :menu

            t.timestamps
        end
        add_index :delivery_areas, :server_id
        add_index :delivery_areas, :menu_id
    end
end
