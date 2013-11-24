require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PhoneNumbersHelper. For example:
#
# describe PhoneNumbersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe PhoneNumbersHelper do
    
    describe "parsePhoneNumber" do

    	it "should return a hash for a valid number" do
    		res = {:country => "1", :area => "123", :number => "456-7890"}
    		parsePhoneNumber("+1 (123) 456-7890").should eq(res)
    	end

    	it "should return a hash for an invalid number" do
    		res = {:country => "1", :area => nil, :number => nil}
    		parsePhoneNumber("+1").should eq(res)
    	end
    end
end
