@joustApp = angular.module("SIBJoust", [], ['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode(true)
])