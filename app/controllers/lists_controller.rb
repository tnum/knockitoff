class ListsController < ApplicationController

  def index
    @list = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(lists_params)

    if @list.save
      redirect_to @list, notice: "List saved successfully."
    else
      flash[:error] = "Error creating list. Please try again."
      render :new
    end
  end

  def update
    @list = List.find(params[:id])
    authorize @list

    if @list.update_attributes(lists_params)
      redirect_to @lists_params
    else
      flash[:error] = "Error saving list. Please try again"
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    title = @list.title

    if @list.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to lists_path
    else
      flash[:error] = "There was an error deleting the list"
      render :show
    end
  end
end

private

def lists_params
  params.require(:list).permit(:title, :description)
end
