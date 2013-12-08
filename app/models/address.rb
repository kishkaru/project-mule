class Address < ActiveRecord::Base

    STATES = ['AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY']

    attr_accessible :city, :line1, :line2, :state, :zip
    validates :city, :line1, :state, :zip, presence: true
    belongs_to :addressable, polymorphic: true

    validates :state, inclusion: {
        in: STATES,
        message: "%{value} is not a valid state. Please use a proper capitalized abbreviation."
    }

    def to_s
        return [self.line1, self.line2, "#{self.city}, #{self.state} #{self.zip}"].compact.join("\n")
    end
end
