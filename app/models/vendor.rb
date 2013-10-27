class Vendor < ActiveRecord::Base
    attr_accessible :address, :email, :name
    has_many :items
end
