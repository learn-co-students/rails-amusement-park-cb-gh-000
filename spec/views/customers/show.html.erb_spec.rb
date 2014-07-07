require 'rails_helper'

RSpec.describe "customers/show", :type => :view do
  before(:each) do
    @customer = Customer.create(name: "Tenzing Norgay Trainor", nausea: 0, happiness: 1, tickets: 10, height: 55)
  end

  it "renders attributes in <p>" do
    render
  end
end
