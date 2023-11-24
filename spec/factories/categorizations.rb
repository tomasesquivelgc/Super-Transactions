FactoryBot.define do
  factory :categorization do
    categorized_transaction { create(:transaction) }
    category { create(:category) }
  end
end
