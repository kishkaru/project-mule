require 'spec_helper'

describe "delivery_areas/show" do
    before(:each) do
        @delivery_area = assign(:delivery_area, stub_model(DeliveryArea,
                :name => "Name",
        ))
        @delivery_points = [assign(:delivery_point, stub_model(DeliveryPoint,
        ))]
    end

    it "renders attributes in <p>" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        rendered.should match(/Name/)
        rendered.should match(//)
    end
end
