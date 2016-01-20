class ApplicationMailer < ActionMailer::Base
  default from: "Mailgun Sandbox <postmaster@sandbox01f0e30b2d4945c397fa73217e6f4923.mailgun.org>"
  layout 'mailer'
end
