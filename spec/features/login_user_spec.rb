require 'rails_helper'

feature 'login user' do
  let!(:user) { Fabricate(:user) }

  scenario '+valid - User signs in correctly' do
    visit login_path
    fill_in("email", with: user.email)
    fill_in("password", with: user.password)
    click_button("Log in")
    expect(page).to have_current_path(root_path)
  end
end
