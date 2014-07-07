require 'rails_helper'

RSpec.describe "static_pages/home", :type => :view do
  before(:each) do
    @owner = assign(:owner, Owner.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
