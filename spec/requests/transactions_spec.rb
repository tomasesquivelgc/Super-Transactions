require 'rails_helper'

RSpec.describe '/transactions', type: :request do
  let(:user) { create(:user) }
  let(:transaction) { create(:transaction) }
  let(:category) { create(:category) }

  context 'when logged in' do
    before do
      sign_in(user)
    end

    describe 'GET /new' do
      it 'renders a successful response' do
        get new_category_transaction_url(category)
        expect(response).to be_successful
      end
    end
  end

  context 'when logged out' do
    describe 'GET /new' do
      it 'redirects to splash page' do
        get new_category_transaction_url(category)
        expect(response).to have_http_status(302)
      end
    end
  end

end
