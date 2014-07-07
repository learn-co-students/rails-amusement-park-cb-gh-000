require 'rails_helper'

RSpec.describe Ride, :type => :model do
  before :each do 
    @attraction = Attraction.create(
      :name => "Roller Coaster",
      :tickets => 5,
      :nausea_rating => 2,
      :happiness_rating => 4,
      :min_height => 32
    )
    @user = User.create(
      :name => "Mindy",
      :nausea => 5,
      :happiness => 3,
      :tickets => 4
    )
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