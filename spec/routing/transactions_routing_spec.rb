require 'rails_helper'

RSpec.describe TransactionsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      # Include the category_id in the expectation
      expect(get: '/categories/1/transactions/new').to route_to('transactions#new', category_id: '1')
    end

    it 'routes to #create' do
      # Include the category_id in the expectation
      expect(post: '/categories/1/transactions').to route_to('transactions#create', category_id: '1')
    end
  end
end
