require 'spec_helper'

describe CartController do

    let(:valid_attributes) { { "name" => "MyString", "description" => "test", "price" => 12.00} }

    describe "GET cart" do
        before(:each) do
            @item = Item.create! valid_attributes
            @session = {:cart => {:items => {@item.id => 2}}}
        end

        it "assigns items in cart to @cart_items" do
            get :cart, {}, @session
            assigns(:cart_items).should eq({@item => 2})
        end

        it "assigns the subtotal to @subtotal" do
            get :cart, {}, @session
            assigns(:subtotal).should eq(@item.price*2)
        end
    end
end
