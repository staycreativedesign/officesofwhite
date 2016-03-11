module MailerHelper
  def file_name(f)
    "#{f[0].remove('_attributes').titleize}"
  end

  def file_location(f)
    "#{f[1]["file"]}"
  end

  def full_name(user)
    @user = user
    "#{@user.first_name} " + "#{@user.last_name}"
  end
end
