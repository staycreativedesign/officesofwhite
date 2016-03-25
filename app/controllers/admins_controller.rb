class AdminsController < ApplicationController
  before_action :is_admin, :set_layout


  private
  def set_layout
    render layout: "admin_layout"
  end
  def is_admin
    if current_user.admin?
    else
      redirect_to login_path
    end
  end
end
