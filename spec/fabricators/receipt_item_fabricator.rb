Fabricator(:receipt_item) do
  name { Faker::Company.name }
  value { Faker::Number.decimal(2) }
end
