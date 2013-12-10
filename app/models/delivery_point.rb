class DeliveryPoint < ActiveRecord::Base

    attr_accessible :latitude, :longitude, :delivery_area, :address_attributes
    validates_presence_of :address

    has_many :customers, :class_name => "User", :foreign_key => "pickup_point_id"
    has_one :address, as: :addressable, :dependent => :destroy
    belongs_to :delivery_area
    has_many :orders

    accepts_nested_attributes_for :address, :update_only => true

    def current_menu
        return self.delivery_area.current_menu rescue nil
    end

end


