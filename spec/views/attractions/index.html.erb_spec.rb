require 'rails_helper'

RSpec.describe "attractions/index", :type => :view do
  before(:each) do
    assign(:attractions, [
      Attraction.create!(),
      Attraction.create!()
    ])
  end

  it "renders a list of attractions" do
    render
  end
end
