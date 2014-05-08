require 'spec_helper'

describe SessionsController do
  describe 'GET new' do
    it 'get the new page' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    it 'create a new session' do
      user = create(:user)
      expect {
        post :create, email: user.email, password: user.password
      }.to change { subject.user_signed_in? }.from(false).to(true)
    end
  end

  describe 'DELETE destroy' do
    it 'destroy the session' do
      user = create(:user)
      subject.send(:sign_in_as, user)
      expect {
        delete :destroy
      }.to change { subject.user_signed_in? }.from(true).to(false)
    end
  end
end
