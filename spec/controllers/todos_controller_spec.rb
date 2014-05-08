require 'spec_helper'

describe TodosController do
  describe 'GET index' do
    it 'get the index page' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    it 'create a new todo' do
      user = create(:user)
      subject.sign_in_as(user)
      expect {
        xhr :post, :create, todo: { title: 'make a wish' }
      }.to change { user.todos.count }.by(1)
    end
  end
end
