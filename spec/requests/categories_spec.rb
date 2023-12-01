require 'rails_helper'

RSpec.describe '/categories', type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category, :with_faker_image) }

  context 'when logged in' do
    before do
      sign_in user
    end

    describe 'GET /root' do
      it 'renders a successful response' do
        get '/'
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /show' do
      it 'renders a successful response' do
        get "/categories/#{category.id}"
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /new' do
      it 'renders a successful response' do
        get new_category_url
        expect(response).to have_http_status(200)
      end
    end
  end

  context 'when logged out' do
    describe 'GET /root' do
      it 'redirects to login page' do
        get '/'
        expect(response).to have_http_status(302)
      end
    end

    describe 'GET /show' do
      it 'redirects to login page' do
        get "/categories/#{category.id}"
        expect(response).to have_http_status(302)
      end
    end

    describe 'GET /new' do
      it 'redirects to login page' do
        get new_category_url
        expect(response).to have_http_status(302)
      end
    end
  end
end
