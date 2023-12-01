class Category < ApplicationRecord
  has_many :categorizations
  has_many :transactions, through: :categorizations
  has_one_attached :image

  validates :name, presence: true
end
