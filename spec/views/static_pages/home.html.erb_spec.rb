require 'rails_helper'

RSpec.describe "static_pages/home", :type => :view do
  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Welcome/)
  end
end
