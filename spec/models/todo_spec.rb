require 'spec_helper'

describe Todo do
  describe '#complete!' do
    it 'complete the todo' do
      todo = create(:todo, completed: false)
      expect {
        todo.complete!
      }.to change { todo.completed }.from(false).to(true)
    end
  end

  describe '#uncomplete!' do
    it 'uncomplete the todo' do
      todo = create(:todo, completed: true)
      expect {
        todo.uncomplete!
      }.to change { todo.completed }.from(true).to(false)
    end
  end
end
