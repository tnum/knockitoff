require 'rails_helper'

feature 'Items completion' do

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

  scenario 'Marking an item completed', :js => true do
  
    visit('/')
    within ("#todo-items") do
      find(:css, '.state[value="1"]').set(true)
    end

    find(:css, "#completed").should have_selector(".edit_item")

    within ("#completed") do
      find(:css, '.edit_item').should_not have_selector(".edit")
      find("input[type='checkbox']").set(false)
    end

    find(:css, "#todo-items").should have_selector(".edit_item")
  end
end

# As a user, I should be able to mark to-do items as complete.