class AddExpirationTimeToMenuItems < ActiveRecord::Migration
  def change
  	add_column :menu_items, :expiration_time, :datetime
  end
end
