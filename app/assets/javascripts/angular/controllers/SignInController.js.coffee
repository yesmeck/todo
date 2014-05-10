angular.module('todoList').controller 'SignInController', [ '$rootScope', '$scope', '$http', '$location', ($rootScope, $scope, $http, $location) ->

  $scope.signIn = ->
    $http.post('/api/sign_in', { email: $scope.email, password: $scope.password }).success( ->
      $rootScope.user = $scope.email
      $rootScope.$emit('userSignedIn', $scope.email)
      $location.path('/')
    ).error( (errors) ->
      $scope.errors = errors
    )
]
