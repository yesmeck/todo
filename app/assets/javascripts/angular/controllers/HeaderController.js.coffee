angular.module('todoList').controller 'HeaderController', [ '$rootScope', '$scope', ($rootScope, $scope) ->
  $scope.user = $rootScope.user

  $rootScope.$on('userSignedIn', (event, user) ->
    $scope.user = user
  )
]
