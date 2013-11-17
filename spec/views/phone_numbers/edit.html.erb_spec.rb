require 'spec_helper'

describe "phone_numbers/edit" do
    before(:each) do
        @phone_number = assign(:phone_number, stub_model(PhoneNumber,
                :country => "MyString",
                :area => "MyString",
                :number => "MyString",
                :extension => "MyString",
                :vendor => nil,
                :user => nil
        ))
    end

    it "renders the edit phone_number form" do
        render

        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "form[action=?][method=?]", phone_number_path(@phone_number), "post" do
            assert_select "input#phone_number_country[name=?]", "phone_number[country]"
            assert_select "input#phone_number_area[name=?]", "phone_number[area]"
            assert_select "input#phone_number_number[name=?]", "phone_number[number]"
            assert_select "input#phone_number_extension[name=?]", "phone_number[extension]"
            assert_select "input#phone_number_vendor[name=?]", "phone_number[vendor]"
            assert_select "input#phone_number_user[name=?]", "phone_number[user]"
        end
    end
end
