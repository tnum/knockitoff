require 'rails_helper'

feature 'Creating todo items' do

  before do
    @user = create(:user)
    visit('/users/sign_in')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    within 'form' do
      click_button 'Sign in'
    end
  end

  scenario 'Successfully' do
    # clicks on add item
    click_on('Add item')
    # fills in description
    fill_in 'Description', with: 'My new todo item'
    # clicks on save
    click_on("Save")
    # sees item
    expect(page).to have_content("My new todo item")
    # sees confirmation message
    expect(page).to have_content("successfully")
  end

  scenario 'Unsucessfully' do
    # user clicks on add item
    click_on('Add item')
    # clicks on save
    click_on("Save")
    # sees error notification
    expect(page).to have_content("error")
    # sees form or expected path
    expect(current_path).to eq("/items/new")
  end
end

# As a signed in user, I should be able to create todo items.