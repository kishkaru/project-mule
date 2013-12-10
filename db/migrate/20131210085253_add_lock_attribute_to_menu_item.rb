class AddLockAttributeToMenuItem < ActiveRecord::Migration
  def change
  	add_column :menu_items, :locked, :boolean
  end
end
