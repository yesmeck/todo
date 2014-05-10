angular.module('todoList').factory 'Todo', ['$resource', ($resource) ->
  $resource('/api/todos/:id', id: '@id', {
    update: { method: 'PUT' }
  })
]
