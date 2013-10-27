class Menu < ActiveRecord::Base
    attr_accessible :date
    has_many :items
end
