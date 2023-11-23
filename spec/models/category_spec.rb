require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valid with valid attributes" do
    category = Category.new(name: "Example Category", image: "example.jpg")
    expect(category).to be_valid
  end

  it "is not valid without a name" do
    category = Category.new(name: nil, image: "example.jpg")
    expect(category).not_to be_valid
  end

  it "is not valid without an image" do
    category = Category.new(name: "Example Category", image: nil)
    expect(category).not_to be_valid
  end

  it "has many categorizations" do
    association = described_class.reflect_on_association(:categorizations)
    expect(association.macro).to eq(:has_many)
  end

end
