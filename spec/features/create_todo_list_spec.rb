require 'rails_helper'
require 'spec_helper'

feature 'A logged in user' do

  before do
    @user = create(:user)
    visit('/users/sign_in')
    within "#new_user" do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on("Sign in")
    end
    @user_list = create(:list)

  end

  scenario 'can create a new list' do
    page.should have_link("Create list")
  end

  scenario 'can create no more than 1 list' do
    expect{ List.new(user: @user_list) }.to raise_error
  end
end

# As a user, I should be able to create a single to-do list.