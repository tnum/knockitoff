require 'rails_helper'

feature 'Items show' do

  before do
    @user  = create(:user)
    visit('/users/sign_in')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    within 'form' do
      click_button 'Sign in'
    end
     create(:item)
  end

  scenario 'A user can not access an item outside of the list' do
    expect { visit('/items/1') }.to raise_error
  end
end

# Users should not be able to access the to-do item outside of the list