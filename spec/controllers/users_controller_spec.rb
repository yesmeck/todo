require 'spec_helper'

describe UsersController do
  describe 'GET new' do
    it 'get the new page' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    it 'create a new user' do
      expect {
        post :create, { user: { email: 'user@example.com', password: 'password' }  }
      }.to change(User, :count).by(1)
    end
  end
end
