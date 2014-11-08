require 'rails_helper'

feature 'An existing user' do

  before do
    @user = create(:user)
    visit('/users/sign_in')
    within "#new_user" do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on("Sign in")
    end
  end

  scenario 'logs in with their credentials' do
    expect(page).to have_content("Signed in successfully.")
  end

  scenario 'then logs out' do
    click_on("Log out")
    expect(page).to have_content("Signed out successfully.")
  end

end

# As a user, I should be able to sign in and out of Blocitoff.