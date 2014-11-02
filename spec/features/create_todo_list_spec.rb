require 'rails_helper'

feature 'User can create a todo list' do

  before do
    @user = create(:user)
    @user_list = create(:list)
    visit('/users/sign_in')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    within 'form' do
      click_button 'Sign in'
    end
  end

  scenario 'User is signed in they can create a list' do
    page.should have_link("Create list")
  end

  scenario 'User can only create one list' do
    expect{ List.new(user: @user_list) }.to raise_error
  end
end