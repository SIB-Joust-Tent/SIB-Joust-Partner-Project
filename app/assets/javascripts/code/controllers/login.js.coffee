@joustApp.controller 'LoginCtrl', (['$scope', '$http', '$window', ($scope, $http, $window) ->
  $scope.signin = ->
    navigator.id.request()

  $scope.signout = ->
    navigator.id.logout() 
])