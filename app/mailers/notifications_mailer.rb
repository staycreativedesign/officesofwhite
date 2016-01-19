class NotificationsMailer < ApplicationMailer
  def new_user_registration
    mail to: "Gustavo Pares <gustavoanalytics@gmail.com>", subject: "This is a test email"

  end
end
