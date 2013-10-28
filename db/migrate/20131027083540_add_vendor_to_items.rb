class AddVendorToItems < ActiveRecord::Migration
    def change
        change_table :items do |t|
            t.references :vendor
        end
    end
end
