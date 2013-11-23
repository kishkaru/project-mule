class PhoneNumber < ActiveRecord::Base
	validates :area, format: {with: /^\d{3}$/,
							message: "Area code must be 3 digits"}
	validate :number, format: {with: /^\d{3}-\d{4}$/,
							message: "Phone number must be of the form 'ddd-dddd'"}

    belongs_to :vendor
    belongs_to :user
    attr_accessible :area, :country, :extension, :number

    # creates and returns a phoneNumber instance given NUMBER
    # with the format of "+d{2,3} (ddd) ddd-dddd". Returns nil if
    # NUMBER is of an invalid format
    def self.createPhoneNumber(number)
    	format = /^\+\d{1,2} \(\d{3}\) \d{3}-\d{4}$/
    	if format.match(number)
    		fields = number.split(" ")
    		tempCountry = fields[0][1,2]
    		tempArea = fields[1][1,3]
    		tempNumber = fields[2][0,8]
    		return PhoneNumber.create(:country => tempCountry,
    									:area => tempArea,
    									:number => tempNumber)
    	else
    		return nil
    	end
    end
end
