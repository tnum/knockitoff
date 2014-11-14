class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Item saved successfully"
      redirect_to root_path
    else
      flash[:error] = "There was an error, please try again"
      redirect_to new_item_path
    end
  end

end

private

def item_params
  params.require(:item).permit(:description)
end