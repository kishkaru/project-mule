require 'spec_helper'

describe "phone_numbers/index" do
  before(:each) do
    assign(:phone_numbers, [
      stub_model(PhoneNumber,
        :country => "Country",
        :area => "Area",
        :number => "Number",
        :extension => "Extension",
        :vendor => nil,
        :user => nil
      ),
      stub_model(PhoneNumber,
        :country => "Country",
        :area => "Area",
        :number => "Number",
        :extension => "Extension",
        :vendor => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Area".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Extension".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 4
  end
end
