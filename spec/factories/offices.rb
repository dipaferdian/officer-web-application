FactoryBot.define do
  factory :office do
    name { Faker::Company.name }
    province { Faker::Address.state }
  end
end