class TodosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_todo, only: [:complete, :uncomplete, :destroy]

  def index
    @todos = current_user.todos.order(:completed, :id) if user_signed_in?
  end

  def create
    @todo = current_user.todos.new(todo_params)
    @todo.save
  end

  def complete
    @todo.complete!
    @todos = current_user.todos
  end

  def uncomplete
    @todo.uncomplete!
    @todos = current_user.todos
  end

  def destroy
    @todo.destroy
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end
end
