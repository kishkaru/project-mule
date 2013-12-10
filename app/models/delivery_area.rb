class DeliveryArea < ActiveRecord::Base
    validates_presence_of :name
    attr_accessible :name #:user

    belongs_to :user, :class_name => "User"
    has_many :menus
    has_many :delivery_points
    has_many :orders, :through => :delivery_points

    def add_delivery_points(points_to_add)
        self.delivery_points = [] and return if points_to_add.blank?
        self.delivery_points.each do |point|
            if points_to_add.include?(point)
                points_to_add = points_to_add - [point]
            end
        end

        self.delivery_points = points_to_add
    end

end
