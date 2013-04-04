@joustApp.controller 'AnalyticsCtrl', (['$scope', '$http', '$location', ($scope, $http, $location) ->
   $http({method: 'GET', url: $location.path() + "/analytics.json" }).success (response) ->
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