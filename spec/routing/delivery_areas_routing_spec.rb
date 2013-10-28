require "spec_helper"

describe DeliveryAreasController do
  describe "routing" do

    it "routes to #index" do
      get("/delivery_areas").should route_to("delivery_areas#index")
    end

    it "routes to #new" do
      get("/delivery_areas/new").should route_to("delivery_areas#new")
    end

    it "routes to #show" do
      get("/delivery_areas/1").should route_to("delivery_areas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/delivery_areas/1/edit").should route_to("delivery_areas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/delivery_areas").should route_to("delivery_areas#create")
    end

    it "routes to #update" do
      put("/delivery_areas/1").should route_to("delivery_areas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/delivery_areas/1").should route_to("delivery_areas#destroy", :id => "1")
    end

  end
end
