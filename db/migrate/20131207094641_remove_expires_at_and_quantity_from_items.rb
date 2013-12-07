class RemoveExpiresAtAndQuantityFromItems < ActiveRecord::Migration
    def up
        remove_column :items, :expires_at
        remove_column :items, :quantity
        remove_column :items, :menu_id
    end

    def down
        add_column :items, :quantity, :integer
        add_column :items, :expires_at, :datetime
        add_column :items, :menu_id, :integer
    end
end
