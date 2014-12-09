require 'rails_helper'

feature 'Editing a profile' do

  before do
    @user = create(:user)
    visit('/users/sign_in')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    within 'form' do
      click_button 'Sign in'
    end
  end
  
  scenario 'as an admin, successfully' do
    within('#current-user') do
      click_link(@user.name)
    end

    expect(current_path).to eq(user_path(@user))

    within('#edit-details') do
      click_link 'Edit profile'
    end

    fill_in 'Name', with: "tee"
    fill_in 'Email', with: "tee@susumu.co.uk"
    fill_in 'Password', with: "helloworld"
    fill_in 'Password confirmation', with: "helloworld"
    fill_in 'Current password', with: @user.password
    click_button 'Update'

    expect(page).to have_content("successfully")

  end

  scenario 'when updating password without a password confirmation' do
    visit('users/edit')

    fill_in 'Name', with: "tee"
    fill_in 'Email', with: "tee@susumu.co.uk"
    fill_in 'Password', with: "helloworld"
    fill_in 'Password confirmation', with: "helloworld"

    click_button 'Update'

    expect(page).to have_content("error")
  end


end

# Users can update their profile details