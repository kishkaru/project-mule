require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :user => nil,
      :transaction_id => "MyString"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", orders_path, "post" do
      assert_select "input#order_user[name=?]", "order[user]"
      assert_select "input#order_transaction_id[name=?]", "order[transaction_id]"
    end
  end
end
