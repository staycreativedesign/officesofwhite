class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def new
    @header = "bg-registration"
    super
  end

  def create
    super
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit! }
  end

end
