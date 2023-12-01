require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'Example User', email: 'user@example.com', password: 'password')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil, email: 'user@example.com', password: 'password')
    expect(user).not_to be_valid
  end

  it 'has many transactions' do
    association = described_class.reflect_on_association(:transactions)
    expect(association.macro).to eq(:has_many)
    expect(association.options[:dependent]).to eq(:destroy)
  end

  it 'includes Devise modules' do
    expect(described_class.devise_modules).to include(:database_authenticatable, :registerable, :recoverable,
                                                      :rememberable, :validatable)
  end

  it 'is database authenticatable' do
    expect(described_class.devise_modules).to include(:database_authenticatable)
  end

  it 'is registerable' do
    expect(described_class.devise_modules).to include(:registerable)
  end

  it 'is recoverable' do
    expect(described_class.devise_modules).to include(:recoverable)
  end

  it 'is rememberable' do
    expect(described_class.devise_modules).to include(:rememberable)
  end

  it 'is validatable' do
    expect(described_class.devise_modules).to include(:validatable)
  end

  it 'has a valid factory' do
    user_bot = create(:user)
    expect(user_bot).to be_valid
  end
end
