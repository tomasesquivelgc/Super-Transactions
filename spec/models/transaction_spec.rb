require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "is valid with valid attributes" do
    user = User.create(name: "example_user", email: "user@example.com", password: "password")
    transaction = Transaction.new(name: "Example Transaction", amount: 100.00, user: user)
    expect(transaction).to be_valid
  end

  it "is not valid without a name" do
    user = User.create(name: "example_user", email: "user@example.com", password: "password")
    transaction = Transaction.new(name: nil, amount: 100.00, user: user)
    expect(transaction).not_to be_valid
  end

  it "is not valid without an amount" do
    user = User.create(name: "example_user", email: "user@example.com", password: "password")
    transaction = Transaction.new(name: "Example Transaction", amount: nil, user: user)
    expect(transaction).not_to be_valid
  end

  it "belongs to a user" do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it "has many categorizations" do
    association = described_class.reflect_on_association(:categorizations)
    expect(association.macro).to eq(:has_many)
  end

  it "has many categories through categorizations" do
    association = described_class.reflect_on_association(:categories)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:through]).to eq(:categorizations)
  end

  it "has a factory bot" do
    transactionBot = create(:transaction)
    expect(transactionBot).to be_valid
  end
end
