class DeliveryPoint < ActiveRecord::Base

    attr_accessible :latitude, :longitude, :delivery_area
    validates_presence_of :latitude, :longitude
    belongs_to :customer, :class_name => "User"
    belongs_to :delivery_area

    has_one :address, as: :addressable

end


