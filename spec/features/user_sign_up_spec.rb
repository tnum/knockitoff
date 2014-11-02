require 'rails_helper'

feature 'User should be able to sign up for a free account' do
  scenario 'Get to the account signup form' do
    visit('/')
    click_on("Sign up")
    # expect(current_path).to eq(new_user_registration(@user))
    expect(current_path).to eq('/users/sign_up')
  end

  scenario 'Successfully create an account' do
    visit('/users/sign_up')
    within 'form' do
      fill_in('Name', :with => 'John Smith')
      fill_in('Email', :with => 'john@example.com')
      fill_in('Password', :with => 'helloworld')
      fill_in('Password confirmation', :with => 'helloworld')
    end
    expect{ click_button("Sign up") }.to change{ User.count }.by(1)
    page.should have_content("You've signed up successfully")
  end
  
end

