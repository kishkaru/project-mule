class AddNameAndEmailToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :customer_name, :string
  	add_column :orders, :customer_email, :string
  end
end
