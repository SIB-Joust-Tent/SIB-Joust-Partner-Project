@joustApp.controller 'MainCtrl', (['$scope', '$http', 'User', ($scope, $http, User) ->
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
    $scope.founders = _.map($scope.founders, (f) ->
      f.tagged
    )
    $scope.team = _.map($scope.team, (f) ->
      f.tagged
    )
    User.query({}, (users) ->
      # Merge the data we are storing with the data we get from Angellist
      for user in users
        team_member = _.findWhere($scope.founders, {name: user.name})
        if !team_member then team_member = _.findWhere($scope.team, {name: user.name})
        if team_member then _.extend(team_member, user)
    )
  )
])