class ApplicationMailer < ActionMailer::Base
  if Rails.env.production?
    default from: "Offices of White and Associates"
  else
    default from: "Mailgun Sandbox <postmaster@sandbox01f0e30b2d4945c397fa73217e6f4923.mailgun.org>"
  end
end
