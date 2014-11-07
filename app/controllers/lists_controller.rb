class ListsController < ApplicationController

  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def lists_params
    params.require(:list).permit(:list, :description)
  end
end
