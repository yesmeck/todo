angular.module('todoList').factory 'Todo', ($resource) ->
  $resource('/api/todos/:id')


