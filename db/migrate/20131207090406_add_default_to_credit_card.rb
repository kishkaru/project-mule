class AddDefaultToCreditCard < ActiveRecord::Migration
  def change
  	add_column :credit_cards, :default, :boolean
  end
end
