class Admin::ReceiptsController < AdminsController

  def index
  end

  def show
  end

  def new
    find_user
  end

  def create
  end
  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
