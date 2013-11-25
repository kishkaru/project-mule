require 'spec_helper'

describe MainController do
    let(:valid_attributes) { { "name" => "DeliveryArea1" } }
    let(:valid_attributes2) { { "name" => "DeliveryArea1", "delivery_points" => "Point A" } }
    #let(:valid_session) { {"customer_area" => { "id" => 1 } } }
    let(:valid_session) { }

    describe "GET home" do
        it "assigns all delivery areas as @delivery_area" do
            delivery_area = DeliveryArea.create! valid_attributes
            get :home, {}, valid_session
            assigns(:delivery_area).should eq([delivery_area])
        end
    end

    describe "GET goToMenu" do
        it "assigns customer area to the relevant delivery area" do
            delivery_area = DeliveryArea.create! valid_attributes
            get :goToMenu, {"customer_area" => { "id" => 1 } }, valid_session
            assigns(:delivery_area).should eq(delivery_area.id.to_s)
        end
    end
end
