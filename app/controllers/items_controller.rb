class ItemsController < ApplicationController
  respond_to :html, :js

  def index
    @to_do_items = Item.where(state: false).where(user_id: current_user)
    @completed_items = Item.where(state: true).where(user_id: current_user)
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = current_user.items.build(item_params)
    authorize @item

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
    authorize @item

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
    @to_do_items = Item.where(state: false).where(user_id: current_user)
    @completed_items = Item.where(state: true).where(user_id: current_user)

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
    #respond_to do |format|
     # format.html { redirect_to root_path }
    #end
  end

  def destroy
  end

end

private

def item_params
  params.require(:item).permit(:description, :status)
end