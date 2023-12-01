require 'faker'
require 'net/http'

FactoryBot.define do
  factory :category do
    name { Faker::Name.name }

    trait :with_faker_image do
      after(:build) do |category|
        image_url = Faker::LoremFlickr.image(size: "300x200", search_terms: ['category', 'placeholder'])
        uri = URI.parse(image_url)
        response = Net::HTTP.get_response(uri)
        category.image.attach(io: StringIO.new(response.body), filename: 'faker_image.jpg', content_type: 'image/jpeg')
      end
    end
  end
end