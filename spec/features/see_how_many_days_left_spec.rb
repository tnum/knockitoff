require 'rails_helper'

feature 'User can see how many days are left for each todo item' do

  before do
    @user  = create(:user)
    visit('/users/sign_in')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    within 'form' do
      click_button 'Sign in'
    end

    visit('/')
    click_on('Add item')
    fill_in 'Description', with: 'My new todo item'
    click_on("Save")
  end

  scenario 'Displays the number of days for each item' do
    expect(page).to have_content("7 days remaining")
  end

end


# As a user, I should be able to see how many days are left 
# before a to-do item is automatically deleted.