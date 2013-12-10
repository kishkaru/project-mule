class MenuItem < ActiveRecord::Base
    belongs_to :item
    belongs_to :menu
    has_many :order_items
    attr_accessible :quantity, :locked, :expiration_time

    def description
        return item.description
    end

    def name
        return item.name
    end

    def price
        return item.price
    end

    def vendor
        return item.vendor
    end

    def create_order(qty)
        item_order = ItemOrder.create(:quantity => qty)
        item_order.menu_item = self
        item_order.save!
        return item_order
    end

    def expiration_time
        return Time.now + 10
    end

end
