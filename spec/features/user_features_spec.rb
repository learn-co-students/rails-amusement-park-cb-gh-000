require_relative "../rails_helper.rb"

describe 'user signup', :type => :feature do
  include LoginHelper
  it 'successfully signs up as non-admin' do
    # see app/spec/support/login_helper.rb
    user_signup
  end
  it 'successfully logs in as non-admin' do
    # see app/spec/support/login_helper.rb
    user_login
  end
  it 'successfully signs up as non-admin' do
    # see app/spec/support/login_helper.rb
    admin_signup
  end
  it 'successfully logs in as non-admin' do
    # see app/spec/support/login_helper.rb
    admin_login
  end
end

describe 'go on ride', :type => :feature do

  before :each do 
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

  it 'has a link from the user show page to the attractions index page' do
    user_signup
    expect(page).to have_content("See rides")
    click_link('See rides')
  end

  it 'links from the user show page to the attractions index page' do
    user_signup
    click_link('See rides')
    expect(current_path).to eq('/attractions')
  end

  it 'has titles of the rides on the attractions index page' do
    user_signup
    click_link('See rides')
    expect(page).to have_content("#{@ferriswheel.name}")
    expect(page).to have_content("#{@rollercoaster.name}")
  end

  it "has links on the attractions index page to the attractions' show pages" do
    user_signup
    click_link('See rides')
    expect(page).to have_content("Go on #{@ferriswheel.name}")
    expect(page).to have_content("Go on #{@rollercoaster.name}")
  end

  it "links from the attractions index page to the attractions' show pages" do
    user_signup
    click_link('See rides')
    click_link("Go on #{@ferriswheel.name}")
    expect(current_path).to eq("/attractions/2")
  end

  it "has a button from the attraction show page to go on the ride" do
    user_signup
    click_link('See rides')
    click_link("Go on #{@ferriswheel.name}")
    expect(current_path).to eq("/attractions/2")
    expect(page).to have_button("Go on this ride")
  end

  it "links from the attraction show page to go on the ride" do
    user_signup
    click_link('See rides')
    click_link("Go on Ferris Wheel")
    click_button("Go on this ride")
    expect(current_path).to eq("/users/1")
  end

end