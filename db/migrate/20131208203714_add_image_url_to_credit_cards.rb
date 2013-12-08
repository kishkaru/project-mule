class AddImageUrlToCreditCards < ActiveRecord::Migration
  def change
  	add_column :credit_cards, :type_image_url, :string
  end
end
