require 'rails_helper'

describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:suffix) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:client_social_security) }
  it { should validate_presence_of(:client_driver_license) }
  it { should validate_presence_of(:client_dob) }
  it { should validate_presence_of(:client_registration_ip) }
end
