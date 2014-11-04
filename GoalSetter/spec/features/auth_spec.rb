#spec /features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'



feature "the signup process" do
  scenario "has a new user page" do
    visit new_user_url 
    expect(page).to have_content("Sign Up")
  end
  feature "signing up a user" do
    before(:each) do
      sign_up('hello_world')
    end
    
    scenario "shows username on the homepage after signup" do
      expect(page).to have_content('hello_world')
    end
  end
end

feature "logging in" do
  #need to make a login page
  #goes to user new page
  
  scenario "has a sign in page" do
    visit new_session_url
    expect(page).to have_content("Sign In")
  end
  
  feature "signing in a user" do
    before(:each) do
      user = User.create!(username: 'hello_world', password: 'special_sauce')
      visit new_session_url
      fill_in 'username', with: user.username
      fill_in 'password', with: 'special_sauce'
      click_on 'Log In'
    end

    scenario "shows username on the homepage after login" do
      expect(page).to have_content('hello_world')
    end

  end
end

feature "logging out" do
  
  scenario "begins with a logged out state" do 
    visit new_session_url
    expect(page).to have_button("Log In")
    expect(page).to_not have_button("Sign Out")
  end
  
  scenario "can sign out" do
    sign_up('hello_world')
    expect(page).to have_content('hello_world')
    expect(page).to have_button("Sign Out")
    click_button "Sign Out"
    expect(page).to have_content("Sign In")
    expect(page).to_not have_button("Sign Out")
    expect(page).to_not have_content('hello_world')
  end
  
  scenario "doesn't show username on the homepage after logout" do
    sign_up('hello_world')
    click_button("Sign Out")
    expect(page).to have_content("Sign In")
    expect(page).to_not have_content('hello_world')
  end
end