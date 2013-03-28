@joustApp.controller 'AngellistCtrl', (['$scope', '$http', ($scope, $http) ->
  test = null
  $http.jsonp("http://api.angel.co/1/startups/127295?callback=JSON_CALLBACK").success((response) ->
    $scope.company_info = response
  ).error((data, status, headers, config) ->
    # Jamie: Here. This is causing an error
    i = 0
  )
])