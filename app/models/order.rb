class Order < ActiveRecord::Base

    attr_accessible :pickup_date

    belongs_to :user
    belongs_to :delivery_point
    has_many :item_orders
    attr_accessible :transaction_id
    accepts_nested_attributes_for :user

    # Returns the order made with CART_ITEMS. CART_ITEMS
    # is a hash of menu items mapped to quantities
    def self.create_with_items(cart_items)
    	new_order = Order.create!
    	cart_items.each do |item, qty|
    		item_order = item.create_order(qty)
    		item_order.order = new_order
    		item_order.save!
    	end
    	return new_order
    end

    def subtotal
        self.item_orders.reduce(0) do |subtotal, item_order|
            puts item_order.quantity
            subtotal + item_order.quantity * item_order.item.price
        end
    end

    def tax
        0.09
    end

    def tax_total
        self.tax * subtotal
    end

    def total
        (1 + self.tax) * subtotal
    end

end
