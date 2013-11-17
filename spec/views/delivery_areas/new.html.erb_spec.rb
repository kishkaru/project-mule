require 'spec_helper'

describe "delivery_areas/new" do
    before(:each) do
        assign(:delivery_area, stub_model(DeliveryArea,
                :name => "MyString",
                :user => nil
        ).as_new_record)
    end

    it "renders new delivery_area form" do
        render

        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "form[action=?][method=?]", delivery_areas_path, "post" do
            assert_select "input#delivery_area_name[name=?]", "delivery_area[name]"
            assert_select "input#delivery_area_user[name=?]", "delivery_area[user]"
        end
    end
end
