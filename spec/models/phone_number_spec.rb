require 'spec_helper'

describe PhoneNumber do

    describe "createPhoneNumber method" do

    	it "should return nil if given an invalid number format" do
    		num = "+2(231) 123-2412"
    		result = PhoneNumber.createPhoneNumber(num)
    		result.should eq(nil)
    	end

    	it "should return a phone number instance if given a valid number format" do
    		num = "+1 (123) 123-2412"
    		result = PhoneNumber.createPhoneNumber(num)
    		result.country.should eq("1")
    		result.area.should eq("123")
    		result.number.should eq("123-2412")
    	end
    end
end
