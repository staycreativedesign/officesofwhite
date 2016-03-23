class AdminsController < ApplicationController
  before_action :is_admin

  private

  def is_admin
    if current_user.admin?
    else
      redirect_to login_path
    end
  end
end
