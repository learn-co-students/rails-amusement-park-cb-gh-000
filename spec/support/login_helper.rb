module LoginHelper

  def user_signup
    visit '/'
    click_link('Sign up')
    expect(current_path).to eq('/users/new')
    fill_in("#user_name", :with => "Amy Poehler")
    fill_in("#user_height", :with => "58")
    fill_in("#user_happiness", :with => "1")
    fill_in("#user_nausea", :with => "2")
    fill_in("#user_tickets", :with => "15")
    click_button('Sign Up')
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Amy Poehler")
    expect(page).to have_content("1")
    expect(page).to have_content("2")
    expect(page).to have_content("15")
    expect(page).to have_content("58")
  end

  def user_login
    @mindy = User.create(:name=>"Mindy", :happiness=>3, :nausea=>2, :tickets=>10, :height=>50)
    visit '/'
    click_link('Sign in')
    expect(current_path).to eq('/signin')
    select "Mindy", :from => "#user_id"
    click_button('Sign In')
    expect(current_path).to eq('/users/#{@mindy.id}')
    expect(page).to have_content("Mindy")
    expect(page).to have_content("3")
    expect(page).to have_content("2")
    expect(page).to have_content("10")
    expect(page).to have_content("50")
  end

  def admin_signup
    visit '/'
    click_link('Sign up')
    expect(current_path).to eq('/users/new')
    fill_in("#user_name", :with => "Walt Disney")
    find(:css, "#user_admin").set(true)
    click_button('Sign Up')
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Walt Disney")
    expect(page).to have_content("ADMIN")
  end

  def admin_login
    @walt = User.create(:name=>"Walt Disney", :admin=>true)
    visit '/'
    click_link('Sign in')
    expect(current_path).to eq('/signin')
    select "Walt Disney", :from => "#user_id"
    click_button('Sign In')
    expect(current_path).to eq('/users/#{@walt.id}')
    expect(page).to have_content("Walt Disney")
    expect(page).to have_content("ADMIN")
  end

end