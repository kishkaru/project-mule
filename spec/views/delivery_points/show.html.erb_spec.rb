require 'spec_helper'

describe "delivery_points/show" do
    before(:each) do
        @delivery_point = assign(:delivery_point, stub_model(DeliveryPoint,
                :address => "Address",
                :latitude => "9.99",
                :longitude => "9.99",
                :customer => nil,
                :delivery_area => nil
        ))
    end

    it "renders attributes in <p>" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        rendered.should match(/Address/)
        rendered.should match(/9.99/)
        rendered.should match(/9.99/)
        rendered.should match(//)
        rendered.should match(//)
    end
end
