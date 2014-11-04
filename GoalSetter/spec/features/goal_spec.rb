#spec /features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'



feature "Making a new goal" do
  scenario "has a new goal page" do
    sign_up('hello_user')
    visit new_goal_url
    expect(page).to have_content("New Goal")
    expect(page).to have_button("Create New Goal")

  end
  
  scenario "creating a goal" do
    sign_up('hello_user')
    create_goal("GET JEORB")
    expect(page).to have_content("GET JEORB")
  end
  
  scenario "validates a title" do 
    sign_up('hello_user')
    visit new_goal_url
    create_goal("")
    expect(page).to have_content("Title can't be blank")
  end
  # feature "signing up a user" do
  #   before(:each) do
  #     sign_up('hello_world')
  #   end
  #
  #   scenario "shows username on the homepage after signup" do
  #     expect(page).to have_content('hello_world')
  #   end
  # end
end

feature "Reading a goal" do
  before(:each) {
    sign_up('hello_user')
    create_goal("GET JEORB")
  }
  scenario "should SEE the goal title" do
    expect(page).to have_content("GET JEORB")
  end
  
  scenario "should SEE the goal status" do
    expect(page).to have_content("NOT COMPLETED")
  end
  
  scenario "should have a way to goals" do
    expect(page).to have_link("Goals")
  end
  
  scenario "should see the goal privacy and edit when author" do
    sign_up('another_user')
    create_private_goal('Marry a Music man')
    expect(page).to have_content("Private")
    click_button('Sign Out')
    sign_up('hello_world')
    visit goal
  end
end

feature "Reading goals" do
  
end

feature "Edit Goals" do
  
end

feature "delete goals" do
  
end
# feature "logging in" do
#   #need to make a login page
#   #goes to user new page
#
#   scenario "has a sign in page" do
#     visit new_session_url
#     expect(page).to have_content("Sign In")
#   end
#
#   feature "signing in a user" do
#     before(:each) do
#       user = User.create!(username: 'hello_world', password: 'special_sauce')
#       visit new_session_url
#       fill_in 'username', with: user.username
#       fill_in 'password', with: 'special_sauce'
#       click_on 'Log In'
#     end
#
#     scenario "shows username on the homepage after login" do
#       expect(page).to have_content('hello_world')
#     end
#
#   end
# end
#
# feature "logging out" do
#
#   scenario "begins with a logged out state" do
#     visit new_session_url
#     expect(page).to have_button("Log In")
#     expect(page).to_not have_button("Sign Out")
#   end
#
#   scenario "can sign out" do
#     sign_up('hello_world')
#     expect(page).to have_content('hello_world')
#     expect(page).to have_button("Sign Out")
#     click_button "Sign Out"
#     expect(page).to have_content("Sign In")
#     expect(page).to_not have_button("Sign Out")
#     expect(page).to_not have_content('hello_world')
#   end
#
#   scenario "doesn't show username on the homepage after logout" do
#     sign_up('hello_world')
#     click_button("Sign Out")
#     expect(page).to have_content("Sign In")
#     expect(page).to_not have_content('hello_world')
#   end
# end