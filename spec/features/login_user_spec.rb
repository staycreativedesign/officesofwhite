require 'rails_helper'

feature 'login user' do
  let(:user) { Fabricate(:user) }
  scenario '+valid - User signs in correctly' do
    visit login_path
    fill_in("user_email", with: user.email)
    fill_in("user_password", with: user.password)
    click_button("Log in")
  end
end
