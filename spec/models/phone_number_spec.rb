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

    describe "validations" do

        describe "should return true for country code" do

            it "of length 1" do
                phone = PhoneNumber.new({:area => "415", :country => "1", :extension => "434", :number => "123-4567"})
                phone.valid?.should eq(true)
            end

            it "of length 2" do
                phone = PhoneNumber.new({:area => "415", :country => "13", :extension => "434", :number => "123-4567"})
                phone.valid?.should eq(true)
            end

        end

        it "should return false for country code of length 3" do
            phone = PhoneNumber.new({:area => "415", :country => "133", :extension => "434", :number => "123-4567"})
            phone.valid?.should eq(false)
        end

        it "should return true for area code of legnth 3" do
            phone = PhoneNumber.new({:area => "415", :country => "1", :extension => "434", :number => "123-4567"})
            phone.valid?.should eq(true)
        end

        it "should return false for area code of length 4" do
            phone = PhoneNumber.new({:area => "4153", :country => "1", :extension => "434", :number => "123-4567"})
            phone.valid?.should eq(false)
        end

        it "should return true for number of format ddd-dddd" do
            phone = PhoneNumber.new({:area => "415", :country => "1", :extension => "434", :number => "123-4567"})
            phone.valid?.should eq(true)
        end

        it "should return false for area code of other format" do
            phone = PhoneNumber.new({:area => "4153", :country => "1", :extension => "434", :number => "1234567"})
            phone.valid?.should eq(false)
        end
    end

end
