class DeliveryArea < ActiveRecord::Base
    validates_presence_of :name
    attr_accessible :name #:user

    belongs_to :user, :class_name => "User"
    belongs_to :menu
    has_many :delivery_points

    def add_delivery_points(points_to_add)
        return if points_to_add.blank?
        self.delivery_points.each do |point|
            if points_to_add.include?(point)
                items_to_add = items_to_add - [point]
            end
        end

        points_to_add.each do |point|
            self.delivery_points << point
        end
    end

end
