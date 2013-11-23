require 'spec_helper'

describe PhoneNumber do

    let(:valid_attributes) { {:area => "415", :country => "1", :extension => "434", :number => "123-4567"} }

    describe "createPhoneNumber method" do

    	it "should return nil if given an invalid number format" do
    		num = "+2(231) 123-2412"
    		result = PhoneNumber.newPhoneNumber(num)
    		result.should eq(nil)
    	end

    	it "should return a phone number instance if given a valid number format" do
    		num = "+1 (123) 123-2412"
    		result = PhoneNumber.newPhoneNumber(num)
    		result.country.should eq("1")
    		result.area.should eq("123")
    		result.number.should eq("123-2412")
    	end
    end

    describe "isEqutalTo method" do

        describe "should compare two PhoneNumbers" do

            it "should recognize equal numbers" do
                first = PhoneNumber.create! valid_attributes
                second = PhoneNumber.create! valid_attributes
                first.isEqualTo(second).should eq(true)
            end

            it "should recognize non-equal numbers" do
                first = PhoneNumber.create! valid_attributes
                second = PhoneNumber.create!({:area => "415", :country => "1", :extension => "434", :number => "123-4867"})
                first.isEqualTo(second).should eq(false)
            end
        end

    end

end
