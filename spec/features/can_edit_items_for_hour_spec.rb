require 'rails_helper'

feature 'Items Edit' do

  before do
    @user  = create(:user)
    visit('/users/sign_in')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    within 'form' do
      click_button 'Sign in'
    end
    
    create(:item, user: @user)
  end

  scenario 'A user can edit a recent' do
    visit('/')
    within ("#todo-items") do
      find(:css, '#edit_item_1').should have_selector(".edit")
    end
  end

  scenario 'Items older than an hour can not be edited' do
    
    create(:item, created_at: 2.hours.ago, user: @user)
    
    visit('/')
    within ("#todo-items") do
      find(:css, '#edit_item_2').should_not have_selector(".edit")
    end

  end
end

# Users can initially edit items