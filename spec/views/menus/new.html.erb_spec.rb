require 'spec_helper'

describe "menus/new" do
    before(:each) do
        assign(:menu, stub_model(Menu).as_new_record)
    end

    it "renders new menu form" do
        render

        # Run the generator again with the --webrat flag if you want to use webrat matchers
        assert_select "form[action=?][method=?]", menus_path, "post" do
        end
    end
end
