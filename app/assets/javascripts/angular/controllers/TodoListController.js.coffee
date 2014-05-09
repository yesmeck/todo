angular.module('todoList').controller 'TodoListController', ($scope, Todo) ->
  $scope.todos = Todo.query()

  $scope.create = ->
    todo = new Todo(title: $scope.todoTitle)
    todo.$save()
    $scope.todos.unshift(todo)
    $scope.todoTitle = ''
