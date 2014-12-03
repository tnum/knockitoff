require 'rails_helper'
require 'rake'

feature 'Items older than 7 days are deleted' do

  before do
     @user  = create(:user)
    visit('/users/sign_in')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    within 'form' do
      click_button 'Sign in'
    end

    @item2 = create(:item, created_at: 7.days.ago)
    @item = create(:item)
    
  end

  scenario 'Two items are initially on the page' do
    visit('/')   
    expect( page ).to have_selector(".edit_item", count: 2)
  end

  scenario 'The older item is deleted' do
    load File.expand_path("../../../lib/tasks/delete_old_items.rake", __FILE__)
    Rake::Task.define_task(:environment)
    Rake::Task["delete_old_items"].invoke
    visit('/') 
    find(:css, "#todo-items").should have_selector(".edit_item", count: 1)
  end
end
