@joustApp.controller 'AnalyticsCtrl', (['$scope', '$routeParams', 'Company', ($scope, $routeParams, Company) ->
  $scope.start_date = new Date(2012, 0, 1)
  $scope.end_date = new Date()
  $scope.account = "Pitchdeck"

  $("#analytics-chart").attr('width', $("#analytics-chart").parent().width())

  $scope.metrics = [
    {name:'Total Visits', key:'visits'},
    {name:'Bounces', key:'bounces'},
    {name:'New Visits', key:'newVisits'},
    {name:'Views', key:'pageviews'},
    {name:'Unique Views', key:'uniquePageviews'},
    {name:'Avg Time on Page', key:'avgTimeOnPage'},
    {name:'Visitors', key:'visitors'},
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

  getDataForSelectedMetric = ->
    _.map($scope.analytics_data.data, (metric) ->
        metric[$scope.analytic_metric.key]
      )

  createAnalyticsChart = ->
    data = 
      labels: $scope.analytics_data.labels,
      datasets: [
        {
          fillColor : "rgba(163,84,55,0.7)",
          strokeColor : "rgba(163,84,55,1)",
          pointColor : "rgba(163,84,55,1)",
          pointStrokeColor : "#fff",
          data: getDataForSelectedMetric()
        }
      ]
    
    ctx = document.getElementById("analytics-chart").getContext("2d")
    new Chart(ctx).Line(data)

  $scope.$watch 'analytic_metric', ->
    if $scope.analytics_data
      createAnalyticsChart()

  $scope.$watch 'start_date + end_date + account', ->
    $("#analytics-chart-holder").spin()
    Company.analytics(
      {
        id:$routeParams.id
        start_date: formatDate($scope.start_date)
        end_date: formatDate($scope.end_date)
        account: $scope.account
        action: 'analytics'
      }, (response) ->
        $("#analytics-chart-holder").spin(false)
        $scope.analytics_data = response
        $scope.totals = {}
        _.each(response.data, (metric) ->
          _.each(metric, (val, key) ->
            if !$scope.totals[key] then $scope.totals[key] = 0.0
            $scope.totals[key] += val
          )
        )
        createAnalyticsChart()
    )
])