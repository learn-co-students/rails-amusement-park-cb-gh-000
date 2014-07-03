require 'rails_helper'

RSpec.describe "attractions/show", :type => :view do
  before(:each) do
    @attraction = assign(:attraction, Attraction.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
