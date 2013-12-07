class Order < ActiveRecord::Base
    belongs_to :user
    has_many :item_orders
    attr_accessible :transaction_id

    def self.create_with_items(cart_items)
    	new_order = Order.create!
    	cart_items.each do |item, qty|
    		item_order = item.create_order(qty)
    		item_order.order = new_order
    		item_order.save!
    	end
    	return new_order
    end

end
