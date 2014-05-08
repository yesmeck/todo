class TodosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_todo, only: [:complete, :uncomplete, :destroy]

  def index
    @todos = current_user.todos.order(position: :asc).order(id: :desc) if user_signed_in?
  end

  def create
    @todo = current_user.todos.new(todo_params)
    @todo.save
  end

  def complete
    @todo.complete!
  end

  def uncomplete
    @todo.uncomplete!
  end

  def destroy
    @todo.destroy
  end

  def sort
    params[:todo].each_with_index do |id, index|
      Todo.where(id: id, user: current_user).update_all(position: index + 1)
    end
    render nothing: true
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end
end
