require_relative "../rails_helper.rb"

describe 'Feature Test: User Signup', :type => :feature do
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

describe 'Feature Test: Go on a Ride', :type => :feature do

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
    @teacups = Attraction.create(
      :name => "Teacups",
      :tickets => 1,
      :nausea_rating => 5,
      :happiness_rating => 1,
      :min_height => 28
    )
    user_signup
  end

  it 'has a link from the user show page to the attractions index page' do
    expect(page).to have_content("See rides")
    click_link('See rides')
  end

  it 'links from the user show page to the attractions index page' do
    click_link('See rides')
    expect(current_path).to eq('/attractions')
  end

  it 'has titles of the rides on the attractions index page' do
    click_link('See rides')
    expect(page).to have_content("#{@ferriswheel.name}")
    expect(page).to have_content("#{@rollercoaster.name}")
  end

  it "has links on the attractions index page to the attractions' show pages" do
    click_link('See rides')
    expect(page).to have_content("Go on #{@ferriswheel.name}")
    expect(page).to have_content("Go on #{@rollercoaster.name}")
  end

  it "links from the attractions index page to the attractions' show pages" do
    click_link('See rides')
    click_link("Go on #{@ferriswheel.name}")
    expect(current_path).to eq("/attractions/2")
  end

  it "has a button from the attraction show page to go on the ride" do
    click_link('See rides')
    click_link("Go on #{@ferriswheel.name}")
    expect(current_path).to eq("/attractions/2")
    expect(page).to have_button("Go on this ride")
  end

  it "clicking on 'Go on ride' redirects to user show page" do
    click_link('See rides')
    click_link("Go on #{@ferriswheel.name}")
    click_button("Go on this ride")
    expect(current_path).to eq("/users/1")
  end

  it "clicking on 'Go on ride' updates the users ticket number" do
    click_link('See rides')
    click_link("Go on #{@ferriswheel.name}")
    click_button("Go on this ride")
    expect(page).to have_content("Tickets: 13")
  end

  it "clicking on 'Go on ride' updates the users mood" do
    click_link('See rides')
    click_link("Go on #{@teacups.name}")
    click_button("Go on this ride")
    expect(page).to have_content("sad")
  end

  it "when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message" do
    click_link('See rides')
    click_link("Go on #{@ferriswheel.name}")
    click_button("Go on this ride")
    expect(page).to have_content("Thanks for riding the #{@ferriswheel.name}!")
  end

  it "when the user is too short, clicking on 'Go on ride' displays a sorry message" do
    @user = User.find_by(:name => "Amy Poehler")
    @user.update(:height => 10)
    click_link('See rides')
    click_link("Go on #{@teacups.name}")
    click_button("Go on this ride")
    expect(page).to have_content("You are not tall enough to ride the #{@teacups.name}")
    expect(page).to have_content("happy")
  end

  it "when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message" do
    @user = User.find_by(:name => "Amy Poehler")
    @user.update(:tickets => 1)
    click_link('See rides')
    click_link("Go on #{@ferriswheel.name}")
    click_button("Go on this ride")
    expect(page).to have_content("You do not have enough tickets the #{@ferriswheel.name}")
    expect(page).to have_content("Tickets: 1")
  end

  it "when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message" do
    @user = User.find_by(:name => "Amy Poehler")
    @user.update(:tickets => 1, :height => 30)
    click_link('See rides')
    click_link("Go on #{@rollercoaster.name}")
    click_button("Go on this ride")
    expect(page).to have_content("You are not tall enough to ride the #{@rollercoaster.name}")
    expect(page).to have_content("You do not have enough tickets the #{@rollercoaster.name}")
    expect(page).to have_content("Tickets: 1")
  end
end