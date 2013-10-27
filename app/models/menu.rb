class Menu < ActiveRecord::Base
    attr_accessible :date
    has_many :items
    has_many :delivery_areas
end
