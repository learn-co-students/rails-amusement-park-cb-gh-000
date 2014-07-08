module LoginHelper

  def user_signup
    visit '/'
    click_link('Sign up')
    expect(current_path).to eq('/users/new')
    fill_in("user[name]", :with => "Amy Poehler")
    fill_in("user[height]", :with => "58")
    fill_in("user[happiness]", :with => "3")
    fill_in("user[nausea]", :with => "2")
    fill_in("user[tickets]", :with => "15")
    click_button('Create User')
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Amy Poehler")
    expect(page).to have_content("Mood")
    expect(page).to have_content("happy")
    expect(page).to have_content("15")
    expect(page).to have_content("58")
  end

  def user_login
    @mindy = User.create(:name=>"Mindy", :happiness=>3, :nausea=>2, :tickets=>10, :height=>50)
    visit '/'
    click_link('Sign in')
    expect(current_path).to eq('/signin')
    select "Mindy", :from => "user[id]"
    click_button('Sign In')
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Mindy")
    expect(page).to have_content("Mood")
    expect(page).to have_content("happy")
    expect(page).to have_content("10")
    expect(page).to have_content("50")
  end

  def admin_signup
    visit '/'
    click_link('Sign up')
    expect(current_path).to eq('/users/new')
    fill_in("user[name]", :with => "Walt Disney")
    find(:css, "#user_admin").set(true)
    click_button('Create User')
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Walt Disney")
    expect(page).to have_content("ADMIN")
  end

  def admin_login
    @mindy = User.create(:name=>"Mindy", :happiness=>3, :nausea=>2, :tickets=>10, :height=>50)
    @walt = User.create(:name=>"Walt Disney", :admin=>true)
    visit '/'
    click_link('Sign in')
    expect(current_path).to eq('/signin')
    select "Walt Disney", :from => "user[id]"
    click_button('Sign In')
    expect(current_path).to eq('/users/2')
    expect(page).to have_content("Walt Disney")
    expect(page).to have_content("ADMIN")
  end

end