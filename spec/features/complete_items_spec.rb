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

    3.times { create(:item) }
  end

  scenario 'Marking an item completed', :js => true do
    # check one of the checkboxes
    visit('/')
    within (".items") do
      check('checkbox')
    end
    # expect item to be greyed out/slashed out
    expect(checked_field.count == 1)
    # expect same checkbox to be checked
    expect(unchecked_field.count == 2)
  end

  scenario 'Unmarking an item' do
    # uncheck one of the completed items
    find(checked_field).uncheck
    # expect item to move to active list on top
    # expect same checkbox to be unchecked
    expect(unchecked_field.count == 3)
  end
end

# As a user, I should be able to mark to-do items as complete.