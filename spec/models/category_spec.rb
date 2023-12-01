require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    category = Category.new(name: 'Example Category')
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(name: nil)
    expect(category).not_to be_valid
  end

  it 'has many categorizations' do
    association = described_class.reflect_on_association(:categorizations)
    expect(association.macro).to eq(:has_many)
  end

  it 'has a factory bot' do
    category_bot = create(:category)
    expect(category_bot).to be_valid
  end
end
