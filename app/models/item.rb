class Item < ActiveRecord::Base
    attr_accessible :description, :expires_at, :name, :price, :quantity, :ingredient_ids, :vendor_id
    validates :description, :expires_at, :name, :price, :quantity, presence: true

    has_and_belongs_to_many :ingredients

    attr_accessible :ingredients_attributes
    accepts_nested_attributes_for :ingredients,
                                  :reject_if => lambda { |attrs| attrs.all? { |key, value| value.blank? } },
                                  :allow_destroy => true

    belongs_to :menu
    belongs_to :vendor
end
