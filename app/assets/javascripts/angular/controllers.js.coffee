@joustApp.controller 'AnalyticsCtrl', (['$scope', '$http', '$location', ($scope, $http, $location) ->
  $http.get($location.path() + "/analytics.json", {}).success((response) ->
    i = 0
  )
])