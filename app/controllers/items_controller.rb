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
      flash[:notice] = "Item saved successfully"
      redirect_to root_path
    else
      flash[:error] = "There was an error, please try again"
      redirect_to new_item_path
    end

  end

  def edit
    @item = Item.where(state: false).find(params[:id])
    if @item.recent?
      flash[:notice] = "Amend to-do item"
    else
      flash[:error] = "Sorry, this item can not be completed"
      redirect_to root_path
    end
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

  def update
    @item = Item.find(params[:id])
    
    if @item.update_attributes(item_params)
      redirect_to root_path
    else
      flash[:error] = "Error, please try again"
      render :edit
    end
    
  end

  def destroy
  end

end

private

def item_params
  params.require(:item).permit(:description, :status)
end