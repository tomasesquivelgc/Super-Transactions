class Category < ApplicationRecord
  has_many :categorizations
  has_many :categorized_transactions, through: :categorizations

  validates :name, presence: true
  validates :image, presence: true
end
