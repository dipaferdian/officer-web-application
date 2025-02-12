FactoryBot.define do
  factory :vehicle do
    name { Faker::Vehicle.make_and_model }
  end
end