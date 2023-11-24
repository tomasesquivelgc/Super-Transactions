require 'rails_helper'

RSpec.describe Categorization, type: :model do
  it 'belongs to a categorized transaction' do
    association = described_class.reflect_on_association(:categorized_transaction)
    expect(association.macro).to eq(:belongs_to)
    expect(association.class_name).to eq('Transaction')
    expect(association.foreign_key).to eq('transaction_id')
  end

  it 'belongs to a category' do
    association = described_class.reflect_on_association(:category)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has a factory bot' do
    categorization_bot = create(:categorization)
    expect(categorization_b).to be_valid
  end
end
