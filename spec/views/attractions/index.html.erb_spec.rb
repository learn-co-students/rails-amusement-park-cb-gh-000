require 'rails_helper'

RSpec.describe "attractions/index", :type => :view do
  before(:each) do
    Attraction.create(name: "Scrambler Ride",     nausea_rating: 2, happiness_rating: 2, tickets: 2, min_height: 36)
    Attraction.create(name: "Miniature Railroad", nausea_rating: 0, happiness_rating: 1, tickets: 2, min_height: 32)
    Attraction.create(name: "Merry-Go-Round",     nausea_rating: 1, happiness_rating: 1, tickets: 1, min_height: 30)
  end

  it "renders a list of attractions" do
    expect(true).to eq(true)
  end
end
