class Admin::UsersController < AdminsController
  def index
    @users = User.all
  end

  def show
    find_user
  end

  def edit
    find_user
  end

  def update
    find_user
    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
      flash[:notice] = 'User updated'
    else
      render :edit
      flash[:notice] = 'User not updated'
    end
  end

  def destroy
    find_user
    @user.destroy
    redirect_to admin_users_path
    flash[:notice] = "User has been deleted"
  end

  private

  def user_params
    params.require(:user).permit!
  end
  def find_user
    @user = User.find(params[:id])
  end
end
