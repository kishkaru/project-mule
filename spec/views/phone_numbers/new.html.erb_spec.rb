require 'spec_helper'

describe "phone_numbers/new" do
  before(:each) do
    assign(:phone_number, stub_model(PhoneNumber,
      :country => "MyString",
      :area => "MyString",
      :number => "MyString",
      :extension => "MyString",
      :vendor => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new phone_number form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", phone_numbers_path, "post" do
      assert_select "input#phone_number_country[name=?]", "phone_number[country]"
      assert_select "input#phone_number_area[name=?]", "phone_number[area]"
      assert_select "input#phone_number_number[name=?]", "phone_number[number]"
      assert_select "input#phone_number_extension[name=?]", "phone_number[extension]"
      assert_select "input#phone_number_vendor[name=?]", "phone_number[vendor]"
      assert_select "input#phone_number_user[name=?]", "phone_number[user]"
    end
  end
end
