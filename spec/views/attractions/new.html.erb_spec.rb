require 'rails_helper'

RSpec.describe "attractions/new", :type => :view do
  before(:each) do
    assign(:attraction, Attraction.new())
  end

  it "renders new attraction form" do
    render

    assert_select "form[action=?][method=?]", attractions_path, "post" do
    end
  end
end
