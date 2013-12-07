class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :quantity
      t.references :item
      t.references :menu

      t.timestamps
    end
    add_index :menu_items, :item_id
    add_index :menu_items, :menu_id
  end
end
