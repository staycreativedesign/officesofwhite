class SessionsController < ApplicationController
  def new
  @header = "bg-login"
  end

  def create
    @header = "bg-login"
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
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end
end

