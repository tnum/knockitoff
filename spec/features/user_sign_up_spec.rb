require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'via the sign up form' do
    visit('/')
    click_on("Sign up")
    expect(current_path).to eq('/users/sign_up')
  end

  scenario 'with incorrect email confirmation' do
    visit('/users/sign_up')
    within "#new_user" do
      fill_in('Name', :with => 'John Smith')
      fill_in('Email', :with => 'john@example.com')
      fill_in('Password', :with => 'helloworld')
      fill_in('Password confirmation', :with => 'heloworld')
      click_button('Sign up')
    end
    expect(page).to have_content("error")
  end

  scenario 'successfully' do
    visit('/users/sign_up')
    within "#new_user" do
      fill_in('Name', :with => 'John Smith')
      fill_in('Email', :with => 'john@example.com')
      fill_in('Password', :with => 'helloworld')
      fill_in('Password confirmation', :with => 'helloworld')
      click_button('Sign up')
    end
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
  
end

# As a user, I should be able to sign up for a free account by providing a user name, password and email address.