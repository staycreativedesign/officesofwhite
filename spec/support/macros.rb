def new_user
  user = Fabricate(:user)
  session[:user_id] = user.id
end

def set_current_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

def set_current_user_feature(user=nil)
  page.set_rack_session(user_id: user.id)
end
def sign_in(a_user = nil, admin = false)
  user = a_user || Fabricate(:user, admin: admin)
  visit login_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Log in"
end

def clear_current_user
  session[:user_id] = nil
end

def selenium_trigger_click(element_name)
  if Capybara.default_driver == :selenium
    page.find(element_name).click
  else
    page.find(element_name).trigger('click')
  end
end

def create_receipt(a_user=nil)
  user = a_user || Fabricate(:user)
  Fabricate(:receipt, user_id: user.id)
end

def create_unpaid_receipt_item(a_user=nil, a_receipt=nil, value=nil)
  user = a_user || Fabricate(:user)
  receipt = a_receipt || Fabricate(:receipt, user_id: user.id)
  Fabricate(:receipt_item, receipt_id: receipt.id, value: value )
end

def create_receipt_item(a_user=nil, a_receipt=nil, value=nil)
  user = a_user || Fabricate(:user)
  receipt = a_receipt || Fabricate(:receipt, user_id: user.id)
  Fabricate(:receipt_item, receipt_id: receipt.id, value: value )
end

def create_paid_receipt_item(a_user=nil, a_receipt=nil, value=nil)
  user = a_user || Fabricate(:user)
  receipt = a_receipt || Fabricate(:receipt, user_id: user.id)
  Fabricate(:receipt_item, receipt_id: receipt.id, value: value, paid: true )
end
