require 'rails_helper'

feature 'Administrator logs in to administrator panel' do
  let!(:jim) { Fabricate(:user, admin: true) }

  scenario '+valid - User signs in as administrator' do
    visit login_path
    fill_in("email", with: jim.email)
    fill_in("password", with: jim.password)
    click_button("Log in")
    expect(page).to have_current_path(admin_panel_index_path)
  end
end
