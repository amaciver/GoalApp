require 'spec_helper'
require 'rails_helper'

feature "goal creation" do

  scenario "allows user to create a private goal" do
    sign_in_user

    visit(user_url(User.last))
    fill_in 'Body', with: 'Caress plants'
    click_on 'Create Goal'

    expect(page).to have_content("Caress plants")
  end

  scenario "allows user to create a public goal" do
    sign_in_user

    visit(user_url(User.last))
    fill_in 'Body', with: 'Water plants'
    choose 'Public'
    click_on 'Create Goal'

    expect(page).to have_content("Water plants")
  end

end

feature "goal viewing" do
  scenario "allows users to see other public goals"
  scenario "hides private goals from other users"
end

feature "goal modification" do
  feature "users can edit thier own goals" do
    scenario "users can edit body"
    scenario "users can edit status"
  end
  scenario "users cannot edit other users' goals"
end

feature "goal deletion" do
  scenario "users can delete their own goals"
  scenario "users cannot delete other users' goals"
end
