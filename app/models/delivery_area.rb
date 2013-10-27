class DeliveryArea < ActiveRecord::Base
    attr_accessible :name

    belongs_to :server, :class_name => "User"
    belongs_to :menu
    has_many :delivery_points

end
