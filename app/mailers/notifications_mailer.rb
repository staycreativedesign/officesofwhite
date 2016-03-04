class NotificationsMailer < ApplicationMailer
  helper :mailer
  def new_user_registration(user)
    @user = user
    attachments['xxx.pdf'] = WickedPdf.new.pdf_from_string(
      render_to_string(:pdf => 'rrr', :layout => 'layouts/submission.pdf.haml', :template => 'users/show.pdf.haml')
    )
    mail to: "gustavoanalytics@gmail.com", subject: "This is a test email", body: "This is your registration please keep it for your records."
  end

  def send_admin_documents(files, user)
    @user = user
    @files = files
    mail to: "gustavoanalytics@gmaim.com", subject: "#{full_name} has sent you an email"
  end

  def full_name
    @user.first_name + " " + @user.last_name
  end
end
