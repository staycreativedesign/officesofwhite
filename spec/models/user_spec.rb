require 'rails_helper'

describe User do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:suffix) }
  it { should validate_presence_of(:primary_phone_1)}
  it { should validate_presence_of(:primary_phone_2)}
  it { should validate_presence_of(:primary_phone_3)}
  it { should validate_presence_of(:driver_license)}
  it { should validate_presence_of(:ss_1)}
  it { should validate_presence_of(:ss_2)}
  it { should validate_presence_of(:ss_3)}
  it { should validate_presence_of(:client_dob) }
  it { should validate_presence_of(:client_ip) }
end
