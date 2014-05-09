angular.module('todoList').controller 'SignInController', ($rootScope, $scope, $http, $location) ->

  $scope.signIn = ->
    $http.post('/api/sign_in', { email: $scope.email, password: $scope.password }).success( ->
      $rootScope.user = $scope.email
      $location.path('/')
    )

