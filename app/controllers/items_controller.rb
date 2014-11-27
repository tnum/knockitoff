class ItemsController < ApplicationController
  respond_to :html, :js

  def index
    @to_do_items = Item.where(state: false)
    @completed_items = Item.where(state: true)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      @item.update_attribute(:days, 7)
      flash[:notice] = "Item saved successfully"
      redirect_to root_path
    else
      flash[:error] = "There was an error, please try again"
      redirect_to new_item_path
    end

  end

  def edit
    @item = Item.find(item_params[:id])
  end

  def update
    @item = Item.find(item_params[:id])
    if @item.save
      flash[:notice] = "Item completed"
    else
      flash[:error] = "There was an error, please try again"
    end
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def destroy
  end

  def toggle
    #mark the item as completed
    @item = Item.find(params[:item_id])
    @item.update_attribute(:state, !@item.state)
    @to_do_items = Item.where(state: false)
    @completed_items = Item.where(state: true)

    respond_to do |format|
      format.js {}
    end
  end

end

private

def item_params
  params.require(:item).permit(:description, :state)
end