class UsersController < ApplicationController
  def new
    @header = "bg-registration"
    @user = User.new
  end

  def create
    @header = "bg-registration"
    @user = User.new(user_params)
    if @user.save
      NotificationsMailer.new_user_registration(@user).deliver_now
      redirect_to waiting_for_approval_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end

  def find_user
    @user = User.find(params[:id])
  end


end
