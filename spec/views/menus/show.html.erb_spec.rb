require 'spec_helper'

describe "menus/show" do
    before(:each) do
        @menu = assign(:menu, stub_model(Menu))
    end

    it "renders attributes in <p>" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
    end
end
