require 'rails_helper'

RSpec.describe AuthenticationsController, type: :request do
  describe 'POST /authenticate_user' do
    let(:permission) { create(:permission, resource: :user) }
    let(:current_user) { create(:user, :admin, permissions: [permission]) }

    it 'returns http success' do
      post '/auth/login', headers: login_token(current_user).merge({'HTTP_USER_AGENT' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36'}),
           params: { auth_user: { email: current_user.email, password: '123456' } }
      expect(response).to have_http_status(:success)
    end
  end
end
