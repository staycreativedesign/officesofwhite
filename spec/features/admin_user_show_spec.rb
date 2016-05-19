require "rails_helper"

feature 'admin user show area' do
  let!(:admin) { Fabricate(:user, approved: true, admin: true) }
  let!(:jim) { Fabricate(:user, first_name: "Jim", last_name: "Bob") }

  scenario 'admin goes admin show', :js => true do
    sign_in(admin)
    click_link('Jim Bob')
    expect(page).not_to have_selector("#contract-start")
    selenium_trigger_click("#approve-registration")
    expect(page).to have_selector("#contract-start")
  end
end
