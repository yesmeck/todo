require 'spec_helper'

describe Todo do
  describe '#complete!' do
    it 'complete the todo' do
      todo = create(:todo, completed: false)
      todo.complete!
      expect(todo.completed).to be_true
    end
  end

  describe '#uncomplete!' do
    it 'uncomplete the todo' do
      todo = create(:todo, completed: true)
      todo.uncomplete!
      expect(todo.completed).to be_false
    end
  end
end
