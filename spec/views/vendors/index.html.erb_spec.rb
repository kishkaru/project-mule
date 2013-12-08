require 'spec_helper'

describe "vendors/index" do
    before(:each) do
        assign(:vendors, [
                stub_model(Vendor,
                    :name => "Name",
                    :address => stub_model(Address, :line1 => "MyString", :line2 => "MyString", :city => "MyString", :state => "CA", :zip => "MyString"),
                    :email => "Email"
                ),
                stub_model(Vendor,
                    :name => "Name",
                    :address => stub_model(Address, :line1 => "MyString", :line2 => "MyString", :city => "MyString", :state => "CA", :zip => "MyString"),
                    :email => "Email"
                )
            ])
    end

    it "renders a list of vendors" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "tr>td", :text => "Name".to_s, :count => 2
#assert_select "tr>td", :text => "Address".to_s, :count => 2
        assert_select "tr>td", :text => "Email".to_s, :count => 2
    end
end
