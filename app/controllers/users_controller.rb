class UsersController < ApplicationController
  before_action :header_image
  def new
    if current_user.present?
      redirect_to root_path
      flash[:notice] = "You already have an account"
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      NotificationsMailer.delay.new_user_registration(@user)
      redirect_to waiting_for_approval_path
    else
      render :new
    end
  end

  private

  def header_image
    @header = "bg-registration"
  end
  def user_params
    params.require(:user).permit!
  end

  def find_user
    @user = User.find(params[:id])
  end


end
