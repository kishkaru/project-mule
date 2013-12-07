class MenuItem < ActiveRecord::Base
    belongs_to :item
    belongs_to :menu
    attr_accessible :quantity

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

end
