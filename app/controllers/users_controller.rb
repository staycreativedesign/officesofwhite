class UsersController < ApplicationController
  def new
    @header = "bg-registration"
    @user = User.new
  end

  def create
    @header = "bg-registration"
    @user = User.new(user_params)
    if @user.save
      NotificationsMailer.delay.new_user_registration(@user.id)
      redirect_to waiting_for_approval_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: '#{@user.id}',
               layout: 'layouts/submission.pdf.haml',
               show_as_html: params[:debug].present?
      end
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
