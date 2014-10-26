require 'rails_helper'

feature 'A user should be able to sign in' do

  scenario 'Get to the sign in form' do
    visit('/')
    click_on("Sign in")
    expect(current_path).to eq('/users/sign_in')
  end

  scenario 'Sign in via the user registration form' do
    visit('/users/sign_in')
    within 'form' do
      fill_in('Email', :with => 'john@example.com')
      fill_in('Password', :with => 'helloworld')
    end
    expect(session[:user_id]).to_not be_nil
    # expect(current_path).to eq(user_session(@user))
  end

  scenario 'A user should be able to sign out' do
    click_on('Sign out')
  end
end