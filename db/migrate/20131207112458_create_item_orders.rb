class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|
      t.references :order
      t.references :menu_item
      t.integer :quantity

      t.timestamps
    end
    add_index :item_orders, :order_id
    add_index :item_orders, :menu_item_id
  end
end
