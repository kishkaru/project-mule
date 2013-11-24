module PhoneNumbersHelper

	# Takes NUM of the form +dd (ddd) ddd-dddd
	# and returns a hash to use to create a phone_number
	# instance. The +dd (ddd) ddd-dddd string may be partial
	def parsePhoneNumber(num)
		country_code = /\+(\d{1,2})/
		area_code = /\((\d{3})\)/
		main_number = /\d{3}-\d{4}/
		country_match = country_code.match(num)
		area_match = area_code.match(num)
		number_match = main_number.match(num)
		return {:country => country_match ? country_match[1] : nil,
			:area => area_match ? area_match[1] : nil,
			:number => number_match ? number_match[0] : nil}
	end
end
