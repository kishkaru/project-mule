require 'spec_helper'

describe "users/show" do
    before(:each) do
        @user = assign(:user, stub_model(User,
                :role => 1,
                :email => "mail@mail.com",
                :phone_number_attributes => {
                    :country => "1",
                    :area => "123",
                    :number => "4567"}
        ))
    end

    it "renders attributes in <p>" do
        render
        # Run the generator again with the --webrat flag if you want to use webrat matchers
        rendered.should match(/1/)
        rendered.should match(/mail@mail.com/)
    end
end
