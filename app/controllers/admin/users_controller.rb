class Admin::UsersController < AdminsController
  def index
    @users = User.all
  end

  def show
    find_user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
