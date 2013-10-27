class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :country
      t.string :area
      t.string :number
      t.string :extension
      t.references :vendor
      t.references :user

      t.timestamps
    end
    add_index :phone_numbers, :vendor_id
    add_index :phone_numbers, :user_id
  end
end
