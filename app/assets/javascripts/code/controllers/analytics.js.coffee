@joustApp.controller 'AnalyticsCtrl', (['$scope', '$routeParams', 'Company', ($scope, $routeParams, Company) ->
  $scope.start_date = new Date(2011, 0, 1)
  $scope.end_date = new Date()

  $scope.metrics = [
    {name:'Total Visits', key:'visits'},
    {name:'Bounces', key:'bounces'},
    {name:'New Visits', key:'newVisits'},
    {name:'% New Visits', key:'percentNewVisits'},
    {name:'Views', key:'pageviews'},
    {name:'Unique Views', key:'uniquePageviews'},
    {name:'Avg Time on Page', key:'avgTimeOnPage'},
    {name:'Visitors', key:'visitors'},
    {name:'Time on Site', key:'timeOnSite'},
    {name:'Avg Time on Site', key:'avgTimeOnSite'}
  ]

  $scope.analytic_metric = $scope.metrics[0]

  formatDate = (date) ->
    dd = date.getDate()
    mm = date.getMonth()+1
    yyyy = date.getFullYear()
    if dd<10 then dd = '0' + dd
    if mm<10 then mm = '0' + mm
    "#{yyyy}-#{mm}-#{dd}"

  $scope.$watch 'start_date + end_date', ->
    $("#analytics-chart-holder").spin()
    Company.analytics(
      {
        id:$routeParams.id, 
        start_date: formatDate($scope.start_date)
        end_date: formatDate($scope.end_date)
      }, (response) ->
        $("#analytics-chart-holder").spin(false)
        ctx = document.getElementById("analytics-chart").getContext("2d")
        $scope.totals = {}
        _.each(response.data, (metric) ->
          _.each(metric, (val, key) ->
            if !$scope.totals[key] then $scope.totals[key] = 0.0
            $scope.totals[key] += val
          )
        )
        chart_values = _.map(response.data, (metric) ->
          metric[$scope.analytic_metric.key]
        )
        data = 
          labels: response.labels,
          datasets: [
            {
              fillColor : "rgba(151,187,205,0.5)",
              strokeColor : "rgba(151,187,205,1)",
              pointColor : "rgba(151,187,205,1)",
              pointStrokeColor : "#fff",
              data: chart_values
            }
          ]
        
        myNewChart = new Chart(ctx).Line(data)
    )
])