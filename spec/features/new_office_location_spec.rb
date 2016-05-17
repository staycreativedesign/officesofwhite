require "rails_helper"

feature 'add new office location' do
  let!(:user) { Fabricate(:user, approved: true, admin: true) }

  scenario '+valid - Administrator adds new office location' do
    sign_in(user)
    selenium_trigger_click('#office')
    selenium_trigger_click('#add-office')
    expect(page).to have_content("Office Name:")
    fill_in("office_location[name]", with: Faker::Company.name)
    fill_in("office_location[address]", with: Faker::Address.street_address)
    fill_in("office_location[city]", with: Faker::Address.city)
    select('FL', from: 'office_location[state]')
    fill_in("office_location[zipcode]", with: Faker::Address.zip)
    fill_in("office_location[phone_number]", with: Faker::PhoneNumber.cell_phone)
    fill_in("office_location[fax_number]", with: Faker::PhoneNumber.cell_phone)
    fill_in("office_location[email]", with: Faker::Internet.email)
    selenium_trigger_click("#submit")
    expect(page).to have_content('Hello')
  end
end
