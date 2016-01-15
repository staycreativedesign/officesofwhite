def new_user
  user = Fabricate(:user)
  session[:user_id] = user.id
end

def set_current_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

def sign_in(a_user=nil)
  user = a_user || Fabricate(:user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Log in"
  visit new_user_first_step_path(user)
end
def clear_current_user
  session[:user_id] = nil
end
