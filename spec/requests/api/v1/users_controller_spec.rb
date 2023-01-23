require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  context 'with success' do
    let(:permission) { create(:permission, resource: :user) }
    let(:current_user) { create(:user, :admin, permissions: [permission]) }
    let(:other_user) { create(:user, :admin, permissions: [permission]) }
    let(:user_params) { { user: { first_name: 'Test', last_name: 'User', email: 'test.user@email.com', status: :active,
                                  password: '123456', password_confirmation: '123456', user_type: :admin_user
    } } }

    describe 'GET /index' do
      it 'returns http success' do
        get api_users_url, headers: login_as(current_user)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /show' do
      it 'returns http success' do
        get api_user_url(other_user.id), headers: login_as(current_user)
        expect(response).to have_http_status(:found)
      end
    end

    describe 'POST /create' do
      it 'returns http success' do
        post api_users_url, params: user_params, headers: login_as(current_user)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /update' do
      it 'returns http success' do
        put api_user_url(other_user.id), params: user_params.except(:user_type), headers: login_as(current_user)
        puts response.body
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /destroy' do
      it 'returns http success' do
        delete api_user_url(other_user.id), headers: login_as(current_user)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
