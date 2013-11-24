class Address < ActiveRecord::Base
    attr_accessible :city, :line1, :line2, :state, :zip
    validates :city, :line1, :state, :zip, presence: true
    belongs_to :addressable, polymorphic: true

    def to_s
        return [self.line1, self.line2, "#{self.city}, #{self.state} #{self.zip}"].compact.join("\n")
    end
end
