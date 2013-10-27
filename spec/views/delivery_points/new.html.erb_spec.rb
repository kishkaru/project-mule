require 'spec_helper'

describe "delivery_points/new" do
  before(:each) do
    assign(:delivery_point, stub_model(DeliveryPoint,
      :address => "MyString",
      :latitude => "9.99",
      :longitude => "9.99",
      :customer => nil,
      :delivery_area => nil
    ).as_new_record)
  end

  it "renders new delivery_point form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", delivery_points_path, "post" do
      assert_select "input#delivery_point_address[name=?]", "delivery_point[address]"
      assert_select "input#delivery_point_latitude[name=?]", "delivery_point[latitude]"
      assert_select "input#delivery_point_longitude[name=?]", "delivery_point[longitude]"
      assert_select "input#delivery_point_customer[name=?]", "delivery_point[customer]"
      assert_select "input#delivery_point_delivery_area[name=?]", "delivery_point[delivery_area]"
    end
  end
end
