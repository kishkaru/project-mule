require 'spec_helper'

describe "vendors/edit" do
    before(:each) do
        @vendor = assign(:vendor, stub_model(Vendor,
                :name => "MyString",
                :address => stub_model(Address, :line1 => "MyString", :line2 => "MyString", :city => "MyString", :state => "MyString", :zip => "MyString"),
                :email => "MyString"
        ))
    end

    it "renders the edit vendor form" do
        render

        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "form[action=?][method=?]", vendor_path(@vendor), "post" do
            assert_select "input#vendor_name[name=?]", "vendor[name]"
#assert_select "input#vendor_address[name=?]", "vendor[address]"
            assert_select "input#vendor_email[name=?]", "vendor[email]"
            assert_select "input#vendor_address_attributes_line1[name=?]", "vendor[address_attributes][line1]"
            assert_select "input#vendor_address_attributes_line2[name=?]", "vendor[address_attributes][line2]"
            assert_select "input#vendor_address_attributes_city[name=?]", "vendor[address_attributes][city]"
            assert_select "input#vendor_address_attributes_state[name=?]", "vendor[address_attributes][state]"
            assert_select "input#vendor_address_attributes_zip[name=?]", "vendor[address_attributes][zip]"
        end
    end
end
