require 'rails_helper'

feature 'User is authorised' do

  before do
    @user  = create(:user)
    @user2  = create(:user)

    visit('/users/sign_in')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    within 'form' do
      click_button 'Sign in'
    end

     3.times { create(:item, user: @user) }
     3.times { create(:item, user: @user2) }
  end

  scenario 'can only see their todo items when logged in' do
    visit('/')
     within ("#todo-items") do
      expect( page ).to have_selector(".edit_item", count: 3 )
    end
  end

  scenario 'when user logs out they can not see the todo items' do
    click_link('Log out')
    visit('/')
    expect( page ).to_not have_selector("#todo-items")
  end

end

# user sees only their own todo items