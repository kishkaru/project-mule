class PhoneNumber < ActiveRecord::Base

	validates :area, format: {with: /^\d{3}$/,
							message: "code must be 3 digits"}, :allow_blank => true
	validates :number, format: {with: /^\d{3}-\d{4}$/,
							message: "number must be 7 digits and of the form 'ddd-dddd'"}, :allow_blank => true
    validates :country, format: {with: /^\d{1,2}$/,
                            message: "code must be 1-2 digits"}, :allow_blank => true
    validate :area_number

    belongs_to :vendor
    belongs_to :user
    attr_accessible :area, :country, :extension, :number

    # Validation that if area or number is present, the other must also be present
    def area_number
        if (area.present? && !number.present?)
            errors.add(:number, "required if area code present")
        end
        if (!area.present? && number.present?)
            errors.add(:area, "code required if number present")
        end
    end

    # Returns the phone number as one string of the form
    # +dd (ddd) ddd-dddd
    # Returns whatever attributes it has set
    def asString
        ctry = country ? "+#{country} " : ""
        area_code = area ? "(#{area}) " : ""
        num = number ? number : ""
        ctry + area_code + num
    end

end
