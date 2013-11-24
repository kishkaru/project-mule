require 'spec_helper'

describe "delivery_points/edit" do
    before(:each) do
        @delivery_point = assign(:delivery_point, stub_model(DeliveryPoint,
                :address => "MyString",
                :latitude => "9.99",
                :longitude => "9.99",
                :customer => nil,
                :delivery_area => nil
        ))
    end

    it "renders the edit delivery_point form" do
        render

        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "form[action=?][method=?]", delivery_point_path(@delivery_point), "post" do
            assert_select "input#delivery_point_address[name=?]", "delivery_point[address]"
            assert_select "input#delivery_point_latitude[name=?]", "delivery_point[latitude]"
            assert_select "input#delivery_point_longitude[name=?]", "delivery_point[longitude]"
        end
    end
end
