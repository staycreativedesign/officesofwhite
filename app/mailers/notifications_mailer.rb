class NotificationsMailer < ApplicationMailer
  def new_user_registration
    mail subject: "This is a test email"

  end
end
