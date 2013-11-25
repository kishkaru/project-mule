require 'spec_helper'

describe "vendors/show" do
    before(:each) do
        @vendor = assign(:vendor, stub_model(Vendor,
                :name => "Name",
                :address => stub_model(Address, :line1 => "MyString", :line2 => "MyString", :city => "MyString", :state => "MyString", :zip => "MyString"),
                :email => "Email"
        ))
    end

    it "renders attributes in <p>" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        rendered.should match(/Name/)
#rendered.should match(/Address/)
        rendered.should match(/Email/)
    end
end
