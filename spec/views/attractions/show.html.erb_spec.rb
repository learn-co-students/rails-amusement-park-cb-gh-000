require 'rails_helper'

RSpec.describe "attractions/show", :type => :view do
  before(:each) do
    @attraction = Attraction.create(name: "Scrambler Ride",     nausea_rating: 2, happiness_rating: 2, tickets: 2, min_height: 36)
  end

  xit "renders attributes in <p>" do
    render
  end
end
