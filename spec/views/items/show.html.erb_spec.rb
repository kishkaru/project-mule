require 'spec_helper'

describe "items/show" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :name => "Name",
      :price => 1.5,
      :description => "MyText",
      :quantity => 1,
      :vendor => stub_model(Vendor, :name => 'Chipotle')
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1.5/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
