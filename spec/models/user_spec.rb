require 'rails_helper'

RSpec.describe User, :type => :model do
  before :each do 
    @user = FactoryGirl.create(:user)
    @rollercoaster = FactoryGirl.create(:attraction)
    @ferriswheel = FactoryGirl.create(:ferriswheel)
  end

  it "is valid with a name, happiness, nausea, and tickets" do
    expect(@user).to be_valid
  end

  it "has many rides" do
    first_ride = Ride.create(:user_id => @user.id, :attraction_id => @rollercoaster.id)
    second_ride = Ride.create(:user_id => @user.id, :attraction_id => @ferriswheel.id)
    expect(@user.rides.first).to eq(first_ride)
    expect(@user.rides.last).to eq(second_ride)
  end

  it "has many attractions through rides" do
    @user.attractions << [@rollercoaster, @ferriswheel]
    expect(@user.attractions.first).to eq(@rollercoaster)
    expect(@user.attractions.last).to eq(@ferriswheel)
  end

end