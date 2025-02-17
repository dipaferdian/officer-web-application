FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user_#{n}" } # Generates unique usernames like user_1, user_2, etc.
    sequence(:email) { |n| "user_#{n}@example.com" } # Generates unique emails like user_1@example.com
    password { "password123" } # Fixed password for testing
    password_confirmation { "password123" } # Matches the password
  end
end
