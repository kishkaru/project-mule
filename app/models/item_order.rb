class ItemOrder < ActiveRecord::Base
    belongs_to :order
    belongs_to :menu_item
    has_one :item, :through => :menu_item
    attr_accessible :quantity

    def full_attributes
        return self.attributes.merge(self.item.attributes)
    end
end
