require 'rails_helper'

describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:suffix) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:social_security) }
  it { should validate_presence_of(:driver_license) }
  it { should validate_presence_of(:dob) }
  it { should validate_presence_of(:registration_ip) }
  it { should validate_presence_of(:home_address) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zipcode) }
  it { should validate_presence_of(:time_at_address_months) }
  it { should validate_presence_of(:time_at_address_years) }
  it { should validate_presence_of(:residence_type) }
  it { should validate_presence_of(:household_payment) }
  it { should validate_presence_of(:employer_name) }
  it { should validate_presence_of(:occupation) }
  it { should validate_presence_of(:employment_address) }
  it { should validate_presence_of(:employment_city) }
  it { should validate_presence_of(:employment_state) }
  it { should validate_presence_of(:employment_zipcode) }
  it { should validate_presence_of(:employment_phone) }
  it { should validate_presence_of(:employment_gross_income) }
  it { should validate_presence_of(:employment_years) }
  it { should validate_presence_of(:employment_months) }
  #it { should validate_inclusion_of(:approved).in_array [true,false] }
  #it { should validate_inclusion_of(:admin).in_array [true,false] }
end
