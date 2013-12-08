require 'spec_helper'

describe "delivery_points/edit" do
    before(:each) do
        @delivery_point = assign(:delivery_point, stub_model(DeliveryPoint,
                :address_attributes => {:city => 'SF', :line1 => "place", :state => "CA", :zip => "11111"},
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
            assert_select "input#delivery_point_address_attributes_city[name=?]", "delivery_point[address_attributes][city]"
            assert_select "input#delivery_point_address_attributes_line1[name=?]", "delivery_point[address_attributes][line1]"
            assert_select "input#delivery_point_address_attributes_line2[name=?]", "delivery_point[address_attributes][line2]"
            assert_select "select#delivery_point_address_attributes_state[name=?]", "delivery_point[address_attributes][state]"
            assert_select "input#delivery_point_address_attributes_zip[name=?]", "delivery_point[address_attributes][zip]"
        end
    end
end
