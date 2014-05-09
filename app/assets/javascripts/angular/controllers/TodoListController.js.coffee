angular.module('todoList').controller 'TodoListController', ($scope, Todo) ->
  $scope.todos = Todo.query()
  console.log($scope.todos)
