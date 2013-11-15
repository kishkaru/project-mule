class AddMenuToItems < ActiveRecord::Migration
    def change
        change_table :items do |t|
            t.references :menu
        end
    end
end
