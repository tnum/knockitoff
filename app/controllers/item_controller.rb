class ItemController < ApplicationController

	def index
    # @list = List.find(params[:list_id])
    @items = Item.all
    # @items = current_user.list.items
		# @items = current_user.list.items
	end

  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @list = List.find(params[:list_id])
    @item = current_user.items.build(item_params)
    @item.list = @list

    if @item.save
      flash[:notice] = "Item saved"
      redirect_to [@list, @item]
    else
      flash[:error] = "There was an error saving the item"
      render :new
    end
  end

  def destroy
  end

end