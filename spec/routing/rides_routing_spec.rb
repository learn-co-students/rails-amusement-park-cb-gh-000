require "rails_helper"

RSpec.describe RidesController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:post => "rides/new").to route_to("rides#new")
    end

  end
end