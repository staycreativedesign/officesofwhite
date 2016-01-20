class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def new
    @header = "bg-registration"
    super
  end
  def create
    @header = "bg-registration"
    super
    NotificationsMailer.new_user_registration(@user).deliver

  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit! }
  end

  protected

  def after_sign_up_path_for(resource)
    waiting_for_approval_path
  end
end
