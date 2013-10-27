class Vendor < ActiveRecord::Base
    attr_accessible :address, :email, :name
    has_many :items
    has_and_belongs_to_many :servers, :class_name => "User"
    has_one :phone_number
end
