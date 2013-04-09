@joustApp.controller 'AnalyticsCtrl', (['$scope', '$http', '$location', ($scope, $http, $location) ->
  $scope.start_date = new Date(2011, 0, 1)
  $scope.end_date = new Date()
  formatDate = (date) ->
    dd = date.getDate()
    mm = date.getMonth()+1
    yyyy = date.getFullYear()
    if dd<10 then dd = '0' + dd
    if mm<10 then mm = '0' + mm
    "#{yyyy}-#{mm}-#{dd}"

  $scope.$watch 'start_date + end_date', ->
    $("#analytics-chart-holder").spin()
    $http(
      method: 'GET', 
      url: $location.path() + "/analytics.json",
      params:
        start_date: formatDate($scope.start_date),
        end_date: formatDate($scope.end_date)
      ).success (response) ->
        $("#analytics-chart-holder").spin(false)
        ctx = document.getElementById("analytics-chart").getContext("2d")
        data = 
          labels: response.labels,
          datasets: [
            {
              fillColor : "rgba(151,187,205,0.5)",
              strokeColor : "rgba(151,187,205,1)",
              pointColor : "rgba(151,187,205,1)",
              pointStrokeColor : "#fff",
              data: response.data
            }
          ]
        
        myNewChart = new Chart(ctx).Line(data)
])