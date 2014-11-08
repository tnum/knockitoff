class ItemController < ApplicationController

	def index
		@item = current_user.list.items
	end

  def create
  end

  def new
  end

  def update
  end

  def destroy
  end

end