class Categorization < ApplicationRecord
  belongs_to :categorized_transaction, class_name: 'Transaction', foreign_key: 'transaction_id'
  belongs_to :category
end
