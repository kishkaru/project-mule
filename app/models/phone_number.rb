class PhoneNumber < ActiveRecord::Base

	validates :area, format: {with: /^\d{3}$/,
							message: "Area code must be 3 digits",
                            if: Proc.new { |p| p.number || p.country }}
	validates :number, format: {with: /^\d{3}-\d{4}$/,
							message: "Phone number must be of the form 'ddd-dddd'",
                            if: Proc.new { |p| p.area || p.country }}
    validates :country, format: {with: /^\d{1,2}$/,
                            message: "Country code must be 1-2 digits",
                            if: Proc.new { |p| p.number || p.area }}

    belongs_to :vendor
    belongs_to :user
    attr_accessible :area, :country, :extension, :number

    # Makes and returns a new phoneNumber instance given NUMBER
    # with the format of "+d{2,3} (ddd) ddd-dddd". Returns nil if
    # NUMBER is of an invalid format. DOES NOT SAVE
    def self.newPhoneNumber(number)
    	format = /^\+\d{1,2} \(\d{3}\) \d{3}-\d{4}$/
    	if format.match(number)
    		fields = number.split(" ")
    		tempCountry = fields[0][1,2]
    		tempArea = fields[1][1,3]
    		tempNumber = fields[2][0,8]
    		return PhoneNumber.new(:country => tempCountry,
    									:area => tempArea,
    									:number => tempNumber)
    	else
    		return nil
    	end
    end

    # Checks if this is equal to OTHER_NUMBER, a PhoneNumber instance
    # That is, area, country, extension, and number are the same
    def isEqualTo(other_number)
    	area == other_number.area && country == other_number.country && extension == other_number.extension && number == other_number.number
    end
end
