require 'rails_helper'

describe 'Todo list items' do

  before do
    @list  = general_list
    3.times { @list.items.create }
  end

  scenario 'Multiple todo items can be added to a list' do
    @list.should have(3).items
  end
end