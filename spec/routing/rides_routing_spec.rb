require "rails_helper"

RSpec.describe RidesController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:post => "users/1/attractions/1/rides/new").to route_to("rides#new", "id"=>"1")
    end

  end
end