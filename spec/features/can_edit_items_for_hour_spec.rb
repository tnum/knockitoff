require 'rails_helper'

feature 'Items Edit' do

  before do
    @user  = create(:user)
    create(:item)

    visit('/users/sign_in')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    within 'form' do
      click_button 'Sign in'
    end
    
  end

  scenario 'A user edits item' do
    within ("#todo-items") do
      #find(:css, '#edit_item_1').should have_selector(".edit")
      click_link("Edit")
    end
    expect(page).to have_content('Description')
    click_button 'Save'
    expect(current_path).to eq(root_path)
  end

  scenario 'A user trys to edit an item older than an hour' do
    
    create(:item, created_at: 2.hours.ago)
    
    visit('/')
    within ("#todo-items") do
      find(:css, '#edit_item_2').should_not have_selector(".edit")
    end

  end
end

# Users can initially edit items