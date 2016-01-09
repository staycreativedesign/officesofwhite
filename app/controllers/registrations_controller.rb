class RegistrationsController < Devise::RegistrationsController
  def new
    @header = "bg-registration"
    super
  end
end
