angular.module('todoList').factory 'Todo', ($resource) ->
  $resource('/api/todos', {},
    query: {
      method: 'GET', isArray: true
    }
  )

