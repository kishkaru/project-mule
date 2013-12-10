class RemoveDeliveryAreaMenuAssociation < ActiveRecord::Migration
  def up
  	remove_index :delivery_areas, column: :menu_id
  	remove_column :delivery_areas, :menu_id
  end
end
