class Admin::PanelController < AdminsController
  def index
    @users = User.all
  end

end
