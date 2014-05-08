class TodosController < ApplicationController
  def index
    @todos = current_user.todos if user_signed_in?
  end

  def create
    @todo = current_user.todos.new(todo_params)
    @todo.save!
  end

  def complete
    @todo = current_user.todos.find(params[:id])
    @todo.complete!
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
