class CreateServersVendorsTable < ActiveRecord::Migration
    def up
        create_table :servers_vendors, :id => false do |t|
            t.integer :server_id
            t.references :vendor
        end
        add_index :servers_vendors, [:server_id, :vendor_id]
        add_index :servers_vendors, :vendor_id
    end

    def down
        drop_table :servers_vendors
    end
end
