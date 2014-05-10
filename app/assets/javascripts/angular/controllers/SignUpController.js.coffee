angular.module('todoList').controller 'SignUpController', ($rootScope, $scope, $http, $location) ->

  $scope.signUp = ->
    $http.post('/api/sign_up', { user: { email: $scope.email, password: $scope.password }}).success( ->
      $rootScope.user = $scope.email
      $rootScope.$emit('userSignedIn', $scope.email)
      $location.path('/')
    ).error((errors) ->
      $scope.errors = errors
    )

