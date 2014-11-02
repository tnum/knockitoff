require 'rails_helper'

feature 'User can create a todo list' do

  before do
    @user = create(:user)
    @user_list = authenticated_list_user
    sign_in @user
  end

  scenario 'User is signed in they can create a list' do
    page.should have_link("Create List")
  end

  scenario 'User can only create one list' do
    sign_in @user_list
    expect{ List.new(user: @user_list) }.to raise_error
    # @user_list.should have_at_most(1).item -- not sure if this should be included
  end
end