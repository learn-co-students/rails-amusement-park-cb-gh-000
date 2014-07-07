require 'rails_helper'

RSpec.describe "attractions/index", :type => :view do
  before(:each) do
    attraction_keys = ["name", "nausea_rating", "happiness_rating", "tickets", "min_height"]
    attractions = [["Scrambler Ride", 2, 2, 2, 36], ["Miniature Railroad", 0, 1, 2, 32], ["Merry-Go-Round", 1, 1, 1, 30]]
    attractions.each do |attraction|
      new_attraction = Attraction.new
      attraction.each_with_index do |attribute, i|
        new_attraction.send(attraction_keys[i] + "=", attribute)
      end
      new_attraction.save
    end
  end

  it "renders a list of attractions" do
    render
  end
end
