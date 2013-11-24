require 'spec_helper'

describe PhoneNumber do

    let(:valid_attributes) { {:area => "415", :country => "1", :extension => "434", :number => "123-4567"} }

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

    describe "can return itself as a string with country-area-number" do

        it "with country code present" do
            phone = PhoneNumber.new(valid_attributes)
            phone.asString.should eq("+1 (415) 123-4567")
        end

        it "without country code" do
            phone = PhoneNumber.new({:area => "415", :number => "123-4567"})
            phone.asString.should eq("(415) 123-4567")
        end
        
    end

end
