require 'rails_helper'

describe Item do

  before do
    @item = create(:item)
  end

  context "A new item has 7 days when created" do
    it "is valid" do
      expect( @item.days ).to eq(7)
    end
  end

  context "days remaining is 6" do
    before do
      @item.days_remaining
    end
    it "is valid" do
      expect( @item.days ).to eq(6)
    end
  end
  
end


# To-do items should be automatically deleted 
# after 7 days from their creation date