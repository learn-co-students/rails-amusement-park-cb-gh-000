require 'rails_helper'

RSpec.describe "attractions/edit", :type => :view do
  before(:each) do
    @attraction = assign(:attraction, Attraction.create!())
  end

  it "renders the edit attraction form" do
    render

    assert_select "form[action=?][method=?]", attraction_path(@attraction), "post" do
    end
  end
end
