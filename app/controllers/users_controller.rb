class UsersController < ApplicationController

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "Details updated successfully"
      redirect_to edit_user_registration_path
    else
      render "devise/registrations/edit"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar)
  end

end
