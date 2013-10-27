class DeliveryArea < ActiveRecord::Base
    belongs_to :server, :class_name => "User"
    belongs_to :menu, :class_name => "User"
    attr_accessible :name

end
