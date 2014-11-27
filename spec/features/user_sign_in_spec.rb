require 'rails_helper'

feature 'A user should be able to sign in' do

  before do
    @user = create(:user)
  end

  scenario 'Get to the sign in form' do
    visit('/')
    click_on("Sign in")
    expect(current_path).to eq('/users/sign_in')
  end

  scenario 'Sign in via the user registration form' do
    visit('/users/sign_in')
    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on("Sign in")
    end
    expect(page).to have_content("Signed in successfully.")
  end
end

# As a user, I should be able to sign into Knockitoff.