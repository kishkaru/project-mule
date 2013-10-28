require 'spec_helper'

describe "phone_numbers/show" do
  before(:each) do
    @phone_number = assign(:phone_number, stub_model(PhoneNumber,
      :country => "Country",
      :area => "Area",
      :number => "Number",
      :extension => "Extension",
      :vendor => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Country/)
    rendered.should match(/Area/)
    rendered.should match(/Number/)
    rendered.should match(/Extension/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
