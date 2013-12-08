require 'spec_helper'

describe "delivery_points/index" do
    before(:each) do
        assign(:delivery_points, [
                stub_model(DeliveryPoint,
                    :address_attributes => {:city => 'SF', :line1 => "place", :state => "CA", :zip => "11111"},
                    :latitude => "8.99",
                    :longitude => "9.99",
                    :customer => nil,
                    :delivery_area => nil
                ),
                stub_model(DeliveryPoint,
                    :address_attributes => {:city => 'SF', :line1 => "place", :state => "CA", :zip => "11111"},
                    :latitude => "8.99",
                    :longitude => "9.99",
                    :customer => nil,
                    :delivery_area => nil
                )
            ])
    end

    it "renders a list of delivery_points" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "tr>td", :text => "place\nSF, CA 11111".to_s, :count => 2
        # Fix these once we get associations going
        # assert_select "tr>td", :text => nil.to_s, :count => 2
        # assert_select "tr>td", :text => nil.to_s, :count => 2
    end
end
