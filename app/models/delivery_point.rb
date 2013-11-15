class DeliveryPoint < ActiveRecord::Base
    belongs_to :customer, :class_name => "User"
    belongs_to :delivery_area
    attr_accessible :address, :latitude, :longitude
end
