require 'spec_helper'

describe "menus/index" do
    before(:each) do
        assign(:menus, [
                stub_model(Menu),
                stub_model(Menu)
            ])
    end

    it "renders a list of menus" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
    end
end
