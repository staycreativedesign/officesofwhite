class SessionsController < ApplicationController
  before_action :set_image_header, only: [:create, :new]
  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You have logged in correctly"
      redirect_to root_path
    else
      flash[:error] = "Please check your email or or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:notice] = "You have logged out"
  end

  private

  def set_image_header
    @header = "bg-login"
  end
end

