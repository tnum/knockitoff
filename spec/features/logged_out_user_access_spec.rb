require 'rails_helper'

feature 'When logged-out' do

  before do

     3.times { create(:item) }
  end

  scenario 'user can not edit an item' do
    visit('/items/1/edit')
      expect( page ).to_not have_content("Description" )
  end

  scenario 'user can not create new items' do
    visit('/items/new')
      expect( page ).to_not have_content("Description" )
  end

end