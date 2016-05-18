Fabricator(:office_location) do
  name { Faker::Company.name }
  address { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state }
  zipcode { Faker::Address.zip }
  phone_number {Faker::PhoneNumber.phone_number}
  fax_number { Faker::PhoneNumber.phone_number }
  email { Faker::Internet.email }
end
