class AddUserAssociationToCreditCards < ActiveRecord::Migration
  def change
  	add_column :credit_cards, :user_id, :integer
  	add_index :credit_cards, :user_id, :name => "index_credit_cards_on_user_id"
  end
end
