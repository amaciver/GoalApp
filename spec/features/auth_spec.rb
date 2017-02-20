require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit(new_user_url)

    expect(page).to have_content
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      visit(new_user_url)
      fill_in("Username", with: "akarpov")
      fill_in("Password", with: "password")
      click_on("Sign Up")

      expect(current_path).to eq("/users/#{User.last.id}")
      expect(page).to have_content("akarpov")
    end

  end

end

feature "logging in" do


  scenario "shows username on the homepage after login" do
    sign_in_user

    expect(current_path).to eq("/users/#{User.last.id}")
    expect(page).to have_content("akarpov")
  end

end

feature "logging out" do

  scenario "begins with a logged out state" do
    user = User.create(username: "akarpov", password: "password")
    visit(user_url(user))

    expect(current_path).to eq("/session/new")
  end


  scenario "doesn't show username on the homepage after logout" do
    user = User.create(username: "akarpov", password: "password")
    visit(new_session_url)
    fill_in("Username", with: "akarpov")
    fill_in("Password", with: "password")
    click_on("Sign In")
    click_on("Sign Out")

    expect(page).to_not have_content(user.username)
  end

end
