require 'rails_helper'

RSpec.describe Ride, :type => :model do
  before :each do 
    @attraction = FactoryGirl.create(:attraction)
    @user = FactoryGirl.create(:user)
    @ride = Ride.create(user_id: @attraction.id, attraction_id: @user.id)
  end

  it "is valid with a user_id and a attraction_id" do
    expect(@ride).to be_valid
  end

  it "belongs to one attraction" do
    expect(@ride.attraction).to eq(@attraction)
  end

  it "belongs to one user" do
    expect(@ride.user).to eq(@user)
  end

end