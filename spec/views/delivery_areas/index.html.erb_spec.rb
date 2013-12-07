require 'spec_helper'

describe "delivery_areas/index" do
    before(:each) do
        assign(:delivery_areas, [
                stub_model(DeliveryArea,
                    :name => "Name",
                ),
                stub_model(DeliveryArea,
                    :name => "Name",
                )
            ])
    end

    it "renders a list of delivery_areas" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "tr>td", :text => "Name".to_s, :count => 2
    end
end
