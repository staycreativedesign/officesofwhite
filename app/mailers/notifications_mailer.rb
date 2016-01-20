class NotificationsMailer < ApplicationMailer
  def new_user_registration(user)
    @user = user
    mail to: @user.email, subject: "This is a test email"
  end
end
