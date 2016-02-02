require 'rails_helper'

feature 'New user sign up' do
  scenario "+valid - User fills out Personal Information", js: true do
    visit new_user_path
    fill_in_personal_information
    fill_in_residence_information
    fill_in_employment_information
    fill_in_credit_information
    fill_in_mother_information
    fill_in_login_information
    fill_in_referral_information
    check_check_boxes
    click_button "SUBMIT INFORMATION"
    expect(page).to have_content("Your request has been sent. Please log out, and wait for an email to be sent to you with further instructions. Thank you")
  end
  def check_check_boxes
    find(".name-warning").click
    find(:css, "#correct_information").click
    find(:css, "#accept_statement").click
    sleep(1)
    find(:css, "#final_statement").click
  end
  def fill_in_phone_number(element_name,number=["555","444","1234"])
    fill_in("user_#{element_name}_1", with: number[0])
    fill_in("user_#{element_name}_2", with: number[1])
    fill_in("user_#{element_name}_3", with: number[2])
  end
  def fill_in_dob(element_name, date=['1985', 'February', '21'])
    select("#{date[0]}", from: "#{element_name}_1i")
    select("#{date[1]}", from: "#{element_name}_2i")
    select("#{date[2]}", from: "#{element_name}_3i")
  end
  def fill_in_referral_information
    fill_in('user_referred_by', with: 'Test Name')
  end
  def fill_in_mother_information
    fill_in_dob("user_credit_mother_dob")
  end
  def fill_in_credit_information
    fill_in('user_credit_login', with: 'xxx@aol.com')
    fill_in('user_credit_password', with: 'thisisapassword')
    fill_in('user_credit_security_answer', with: 'securityquestion')
  end
  def fill_in_employment_information
    fill_in('user_employer_name', with: 'USAA')
    fill_in('user_occupation', with: 'Programmer')
    fill_in('user_employment_address', with: 'Text')
    fill_in('user_employment_city', with: 'Text')
    select('FL', from: 'user_employment_state')
    fill_in('user_employment_zipcode', with: 74133)
    fill_in_phone_number('employment_phone')
    fill_in('user_employment_gross_income', with: '5000')
    select('2', from: 'user_employment_years')
    select('2', from: 'user_employment_months')
  end
  def fill_in_residence_information
    fill_in('user_home_address', with: 'Text')
    fill_in('user_city', with: 'Text')
    select('FL', from: 'user_state')
    fill_in('user_zipcode', with: 74133)
    select('2', from: 'user_time_at_address_months')
    select('5', from: 'user_time_at_address_years')
    select('Rent', from: 'user_residence_type')
    fill_in('user_household_payment', with: '5000')
  end
  def fill_in_personal_information
    select('Mr.', from: 'user_suffix')
    fill_in('user_first_name', with: 'Text')
    fill_in('user_middle_name', with: 'Text')
    fill_in('user_last_name', with: 'Text')
    fill_in_phone_number('phone_number')
    fill_in_phone_number('other_phone_number')
    fill_in('user_driver_license', with: 'Text')
    fill_in('user_ss_1', with: 590)
    fill_in('user_ss_2', with: 41)
    fill_in('user_ss_3', with: 5333)
    fill_in_dob("user_dob")
  end

  def fill_in_login_information
    fill_in('user_email', with: Faker::Internet.email)
    fill_in('user_password', with: "brasileiro1")
    fill_in('user_password_confirmation', with: "brasileiro1")
  end
end
