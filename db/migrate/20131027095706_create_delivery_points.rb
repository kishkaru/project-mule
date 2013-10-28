class CreateDeliveryPoints < ActiveRecord::Migration
  def change
    create_table :delivery_points do |t|
      t.string :address
      t.decimal :latitude
      t.decimal :longitude
      t.references :customer
      t.references :delivery_area

      t.timestamps
    end
    add_index :delivery_points, :customer_id
    add_index :delivery_points, :delivery_area_id
  end
end
