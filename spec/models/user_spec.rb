require 'rails_helper'

RSpec.describe User, :type => :model do
  before :each do 
    @user = User.create(
      :name => "Mindy",
      :nausea => 5,
      :happiness => 3,
      :tickets => 4,
      :height => 34
    )
    @rollercoaster = Attraction.create(
      :name => "Roller Coaster",
      :tickets => 5,
      :nausea_rating => 2,
      :happiness_rating => 4,
      :min_height => 32
    )
    @ferriswheel = Attraction.create(
      :name => "Ferris Wheel",
      :tickets => 2,
      :nausea_rating => 2,
      :happiness_rating => 1,
      :min_height => 28
    )
  end

  it "is valid with a name, happiness, nausea, height, and tickets" do
    expect(@user).to be_valid
  end

  it "is valid with an admin boolean" do
    @walt = User.create(:name => "Walt Disney", :admin => true)
    expect(@walt).to be_valid
  end

  it "is has an admin boolean" do
    @walt = User.create(:name => "Walt Disney", :admin => true)
    expect(@walt.admin).to eq(true)
  end

  it "defaults to admin => false" do
    expect(@user.admin).to eq(false)
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

  it "has a method 'mood' that returns 'sad' when the user is more nauseous than happy" do
    expect(@user.mood).to eq("sad")
  end

  it "has a method 'mood' that returns 'happy' when the user is more happy than nauseous" do
    @user.update(:happiness => 7)
    expect(@user.mood).to eq("happy")
  end

end