require 'rails_helper'

describe 'Completed Items' do

  before do
    @user  = authenticated_user
    @list  = general_list
    3.times { @list.items.create }
    sign_in @user

    @user.create_item(description: "New todo item")
  end

  scenario 'Item marked as complete and removed from list' do
    expect(page).to have_content("New todo item")
    check 'completed'
    visit(current_path)
    expect(page).to_not have_content("New todo item")
  end
end
