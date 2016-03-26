class AdminsController < ApplicationController
  before_action :is_admin
  layout 'admin_layout'

  private
    def is_admin
      if !current_user.admin?
        redirect_to login_path
      end
    end
end
