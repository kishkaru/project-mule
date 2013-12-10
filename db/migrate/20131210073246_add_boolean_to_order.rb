class AddBooleanToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :picked_up, :boolean, :default => false
  end

end
