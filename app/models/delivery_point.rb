class DeliveryPoint < ActiveRecord::Base

    attr_accessible :latitude, :longitude, :delivery_area, :address_attributes
    validates_presence_of :latitude, :longitude, :address

    belongs_to :customer, :class_name => "User"
    belongs_to :delivery_area

    has_one :address, as: :addressable

    accepts_nested_attributes_for :address, :update_only => true

end


