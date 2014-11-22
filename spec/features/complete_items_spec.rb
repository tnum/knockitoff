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
    within (".todo-items") do
      find(:css, '.state[value="1"]').set(true)
    end
    # expect item to be greyed out/slashed out
    find(:css, ".todo-items").should_not have_selector(".edit_item")
    # expect same checkbox to be checked
    #expect(unchecked_field.count == 0)
  end

  scenario 'Unmarking an item' do
    # uncheck one of the completed items
    # find(checked_field).uncheck
    # expect item to move to active list on top
    # expect same checkbox to be unchecked
    #expect(unchecked_field.count == 3)
  end
end

# As a user, I should be able to mark to-do items as complete.