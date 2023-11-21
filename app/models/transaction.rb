class Transaction < ApplicationRecord
  belongs_to :user
  has_many :categorizations
    has_many :categories, through: :categorizations

  validates :name, presence: true
  validates :amount, presence: true
end
