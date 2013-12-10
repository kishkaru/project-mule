class AddDeliveryAreaMenuAssociation < ActiveRecord::Migration
  def up
  	add_column :menus, :delivery_area_id, :integer
  	add_index :menus, :delivery_area_id, :name => "index_menus_on_delivery_areas_id"
  end
end
