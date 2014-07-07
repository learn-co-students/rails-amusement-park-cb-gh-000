require "rails_helper"

RSpec.describe OwnersController, :type => :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/owners/1").to route_to("owners#show", :id => "1")
    end

    it "routes to #login" do
      expect(:get => "/owners/login").to route_to("owners#login")
    end

    it "routes to #login_user" do
      expect(:post => "/owners/login_user").to route_to("owners#login_user")
    end
  end
end
