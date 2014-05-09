todoList = angular.module('todoList', ['ngRoute', 'ngResource'])

todoList.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

todoList.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/', templateUrl: '/templates/todo_list.html', controller: 'TodoListController'
  $routeProvider.when '/sign_in', templateUrl: '/templates/sign_in.html', controller: 'SignInController'
  $routeProvider.when '/sign_up', templateUrl: '/templates/sign_up.html', controller: 'SignUpController'

todoList.run ($rootScope, $location, $timeout) ->
  $rootScope.$on("$routeChangeStart", (event, next, current) ->
    if $rootScope.user == '' && $location.path() != '/sign_up'
      $location.path('/sign_in')
  )

