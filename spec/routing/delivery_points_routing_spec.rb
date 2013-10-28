require "spec_helper"

describe DeliveryPointsController do
  describe "routing" do

    it "routes to #index" do
      get("/delivery_points").should route_to("delivery_points#index")
    end

    it "routes to #new" do
      get("/delivery_points/new").should route_to("delivery_points#new")
    end

    it "routes to #show" do
      get("/delivery_points/1").should route_to("delivery_points#show", :id => "1")
    end

    it "routes to #edit" do
      get("/delivery_points/1/edit").should route_to("delivery_points#edit", :id => "1")
    end

    it "routes to #create" do
      post("/delivery_points").should route_to("delivery_points#create")
    end

    it "routes to #update" do
      put("/delivery_points/1").should route_to("delivery_points#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/delivery_points/1").should route_to("delivery_points#destroy", :id => "1")
    end

  end
end
