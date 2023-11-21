class Category < ApplicationRecord
  has_many :categorizations
  has_many :transactions, through: :categorizations

  validates :name, presence: true
  validates :icon, presence: true
end
