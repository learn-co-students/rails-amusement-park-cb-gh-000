require "rails_helper"

RSpec.describe RidesController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:post => "customers/1/attractions/1/rides/new").to route_to("rides#new")
    end

  end
end