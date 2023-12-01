require 'faker'

FactoryBot.define do
  factory :transaction do
    user_id { create(:user).id }
    name { Faker::Name.name }
    amount { Faker::Number.number(digits: 3) }
  end
end
