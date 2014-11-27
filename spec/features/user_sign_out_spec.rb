require 'rails_helper'

feature 'A user should be able to log out' do

  before do
    user = create(:user)
    visit('/users/sign_in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    within 'form' do
      click_button 'Sign in'
    end
  end

  scenario 'Click the log out link and successfully log out' do
    click_link('Log out')
    expect(page).to have_content("Signed out successfully.")
  end

end

# As a user, I should be able to sign out of Knocitoff.