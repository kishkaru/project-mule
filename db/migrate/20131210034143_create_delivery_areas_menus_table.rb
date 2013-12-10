class CreateDeliveryAreasMenusTable < ActiveRecord::Migration
  	def up
        create_table :delivery_areas_menus, :id => false do |t|
            t.references :delivery_area
            t.references :menu
        end
        add_index :delivery_areas_menus, [:menu_id, :delivery_area_id]
        add_index :delivery_areas_menus, :delivery_area_id
    end

    def down
        drop_table :delivery_areas_menus
    end
end
