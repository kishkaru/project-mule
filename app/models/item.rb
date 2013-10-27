class Item < ActiveRecord::Base
    attr_accessible :description, :expires_at, :name, :price, :quantity
    has_and_belongs_to_many :ingredients
end
