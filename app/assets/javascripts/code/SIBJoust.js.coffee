@joustApp = angular.module("SIBJoust", ["ui"], ['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode(true)
])