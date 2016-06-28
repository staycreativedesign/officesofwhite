module AdminUsersHelper
  def contract_start
    user_params = params["user"]
    case
    when user_params["approved"]
      approve_user
    when user_params["pro_bono"]
      pro_bono
    end
  end

  def approve_user
    jq_fade_in("#contract-start")
    jq_fade_in("#invoice-start")
  end

  def pro_bono
    if params["user"]["pro_bono"] == "true"
      jq_fade_in(".is-pro-bono")
    else
      jq_fade_out(".is-pro-bono")
    end
  end

  def full_user_name(user)
    "#{user.first_name} #{user.try(:middle_name)} #{user.last_name}"
  end

  private

  def jq_fade_in(name)
    "$(\"#{name}\").fadeIn();".html_safe
  end

  def jq_fade_out(name)
    "$(\"#{name}\").fadeOut();".html_safe
  end

end
