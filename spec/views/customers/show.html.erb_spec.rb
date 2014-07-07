require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = User.create(name: "Tenzing Norgay Trainor", nausea: 0, happiness: 1, tickets: 10, height: 55)
  end

  it "renders attributes in <p>" do
    render
  end
end
