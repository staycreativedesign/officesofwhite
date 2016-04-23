require 'rails_helper'

feature 'login user' do
  let!(:user) { Fabricate(:user, approved: true, admin: true) }

  scenario '+valid - User signs in correctly and is approved' do
    visit login_path
    fill_in("email", with: user.email)
    fill_in("password", with: user.password)
    click_button("Log in")
    expect(page).to have_content("ADMINISTRATION")
  end
end
