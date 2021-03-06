class Item < ActiveRecord::Base

    attr_accessible :description, :name, :price, :vendor_id
    validates :description, :name, :price, presence: true

    has_and_belongs_to_many :ingredients
    has_many :menu_items

    attr_accessible :ingredients_attributes
    accepts_nested_attributes_for :ingredients,
                                  :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } },
                                  :allow_destroy => true

    belongs_to :vendor

    def create_menu_item(options={})
        menu_item =  MenuItem.create(:quantity => options[:quantity] || 0)
        menu_item.item = self
        menu_item.save!
        return menu_item
    end

end
