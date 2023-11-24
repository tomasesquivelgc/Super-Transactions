require 'faker'

FactoryBot.define do
  factory :category do
    name { Faker::Name.name }
    image { Faker::Internet.url }
  end
end