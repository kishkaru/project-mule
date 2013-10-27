require 'spec_helper'

describe "delivery_points/index" do
  before(:each) do
    assign(:delivery_points, [
      stub_model(DeliveryPoint,
        :address => "Address",
        :latitude => "9.99",
        :longitude => "9.99",
        :customer => nil,
        :delivery_area => nil
      ),
      stub_model(DeliveryPoint,
        :address => "Address",
        :latitude => "9.99",
        :longitude => "9.99",
        :customer => nil,
        :delivery_area => nil
      )
    ])
  end

  it "renders a list of delivery_points" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
