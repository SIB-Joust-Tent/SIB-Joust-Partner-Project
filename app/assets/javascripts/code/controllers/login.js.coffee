@joustApp.controller 'LoginCtrl', (['$scope', ($scope) ->
  $scope.signin = ->
    navigator.id.request()

  $scope.signout = ->
    navigator.id.logout() 
])