require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :user => nil,
        :transaction_id => "Transaction"
      ),
      stub_model(Order,
        :user => nil,
        :transaction_id => "Transaction"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Transaction".to_s, :count => 2
  end
end
