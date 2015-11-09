require 'rails_helper'

feature 'New user sign up' do
  scenario "sign up is created successfully" do
    visit(new_user_registration_path)
    select('Mr.', from: 'user_suffix')
    fill_in('First name', with: 'Text')
    fill_in('Middle name', with: 'Text')
    fill_in('Last name', with: 'Text')
    fill_in('user_phone_number_1', with: 333)
    fill_in('user_phone_number_2', with: 555)
    fill_in('user_phone_number_3', with: 4532)
    fill_in('user_other_phone_number_1', with: 305)
    fill_in('user_other_phone_number_2', with: 555)
    fill_in('user_other_phone_number_3', with: 5555)
    fill_in('user_client_driver_license', with: 'Text')
    fill_in('user_client_ss_1', with: 590)
    fill_in('user_client_ss_2', with: 41)
    fill_in('user_client_ss_3', with: 5333)
    select('February', from: 'user_client_dob_2i')
    select('21', from: 'user_client_dob_3i')
    select('1985', from: 'user_client_dob_1i')
   end

end
