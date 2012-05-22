require "spec_helper"

describe BeliefsController do
  describe "routing" do

    it "routes to #index" do
      get("/beliefs").should route_to("beliefs#index")
    end

    it "routes to #new" do
      get("/beliefs/new").should route_to("beliefs#new")
    end

    it "routes to #show" do
      get("/beliefs/1").should route_to("beliefs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/beliefs/1/edit").should route_to("beliefs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/beliefs").should route_to("beliefs#create")
    end

    it "routes to #update" do
      put("/beliefs/1").should route_to("beliefs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/beliefs/1").should route_to("beliefs#destroy", :id => "1")
    end

  end
end
