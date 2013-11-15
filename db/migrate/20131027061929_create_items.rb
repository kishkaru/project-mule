class CreateItems < ActiveRecord::Migration
    def change
        create_table :items do |t|
            t.string :name
            t.float :price
            t.text :description
            t.integer :quantity
            t.datetime :expires_at

            t.timestamps
        end
    end
end
