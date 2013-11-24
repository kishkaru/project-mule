class DeliveryPoint < ActiveRecord::Base

    attr_accessible :address, :latitude, :longitude, :delivery_area
    validates_presence_of :address, :latitude, :longitude
    belongs_to :customer, :class_name => "User"
    belongs_to :delivery_area
    accepts_nested_attributes_for :address, :update_only => true 

end


