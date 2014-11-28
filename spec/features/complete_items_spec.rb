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

     create(:item)
  end

  scenario 'Marking an item completed', :js => true do
    # check one of the checkboxes
    visit('/')
    within ("#todo-items") do
      find(:css, '.state[value="1"]').set(true)
    end
    # expect item to be greyed out/slashed out
    find(:css, "#completed").should have_selector(".edit_item")

    within ("#completed") do
      find("input[type='checkbox']").set(false)
    end
    # expect item to move to active list on top
    find(:css, "#todo-items").should have_selector(".edit_item")
    # expect same checkbox to be unchecked
    #expect(unchecked_field.count == 1)
  end

  scenario 'Unmarking an item', :js => true do
    
  end
end

# As a user, I should be able to mark to-do items as complete.