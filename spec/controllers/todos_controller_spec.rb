require 'spec_helper'

describe TodosController do
  let(:user) { create(:user) }

  before(:each) do
    subject.sign_in_as(user)
  end

  describe 'GET index' do
    it 'get the index page' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    it 'create a new todo' do
      expect {
        xhr :post, :create, todo: { title: 'make a wish' }
      }.to change { user.todos.count }.by(1)
    end
  end

  describe 'POST complete' do
    it 'complete the todo' do
      todo = create(:todo, completed: false, user: user)
      xhr :post, :complete, id: todo.id
      expect(todo.reload.completed).to be_true
    end
  end

  describe 'POST uncomplete' do
    it 'uncomplete the todo' do
      todo = create(:todo, completed: true, user: user)
      xhr :post, :uncomplete, id: todo.id
      expect(todo.reload.completed).to be_false
    end
  end

  describe 'DELETE destroy' do
    it 'delete the todo' do
      todo = create(:todo, user: user)
      expect {
        xhr :delete, :destroy, id: todo.id
      }.to change { Todo.count }.by(-1)
    end
  end
end
