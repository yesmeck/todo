angular.module('todoList').controller 'TodoListController', ($scope, Todo, $http) ->
  $scope.todos = Todo.query()

  $scope.create = ->
    todo = new Todo(title: $scope.todoTitle)
    todo.$save()
    $scope.todos.unshift(todo)
    $scope.todoTitle = ''

  $scope.complete = (todo) ->
    todo.completed = true
    todo.$update()

  $scope.destroy = (todo) ->
    todo.$delete()
    $scope.todos.splice($scope.todos.indexOf(todo), 1)

  $scope.sortableOptions =
    stop: (e, ui) ->
      $http.post('/api/todos/sort', $scope.todos.map((todo) -> todo.id))
