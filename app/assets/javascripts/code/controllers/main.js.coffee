@joustApp.controller 'MainCtrl', (['$scope', '$http', ($scope, $http) ->
  test = null
  createStoryJS({
    type:       'timeline',
    width:      '100%',
    height:     '400',
    source:     'http://docs.google.com/spreadsheet/pub?key=0ArNWRIA9E7UPdGt3SDJoYVU4LXgzMEh5T1NMdDRnLXc&output=html',
    embed_id:   'company-timeline',
    css:        '/assets/timeline.css',
    js:         '/assets/timeline-min.js'
  })

  $scope.getBgImg = (user) ->
    { 'background': "url('" + user.image + "') no-repeat" }
    
  $http.jsonp("http://api.angel.co/1/startups/127295?callback=JSON_CALLBACK").success((response) ->
    $scope.company_info = response
  )

  $http.jsonp("http://api.angel.co/1/startups/127295/roles?callback=JSON_CALLBACK").success((response) ->
    $scope.founders = _.where(response.startup_roles, {role: "founder"})
    $scope.team = _.difference(response.startup_roles, $scope.founders)
  )
])