class CreateIngredientsItemsTable < ActiveRecord::Migration
    def up
        create_table :ingredients_items, :id => false do |t|
            t.references :ingredient
            t.references :item
        end
        add_index :ingredients_items, [:item_id, :ingredient_id]
        add_index :ingredients_items, :ingredient_id
    end

    def down
        drop_table :ingredients_item
    end
end
