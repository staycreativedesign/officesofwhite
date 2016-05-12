Fabricator(:office_location) do
  name { Faker::Company.name }
  address { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state }
  zipcode { Faker::Address.zip }
end
