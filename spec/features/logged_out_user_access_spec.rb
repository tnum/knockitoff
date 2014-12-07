require 'rails_helper'

feature 'Logged out user can not access items' do

  before do

     3.times { create(:item) }
  end

  scenario 'can not access edit items URL' do
    visit('/items/1/edit')
      expect( page ).to_not have_content("Description" )
  end

  scenario 'can not create new items' do
    visit('/items/new')
      expect( page ).to_not have_content("Description" )
  end

end