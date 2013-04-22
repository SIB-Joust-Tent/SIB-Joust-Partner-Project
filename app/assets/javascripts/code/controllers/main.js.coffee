@joustApp.controller 'MainCtrl', (['$scope', '$http', 'Company', ($scope, $http, Company) ->
  $scope.getBgImg = (user) ->
    { 'background': "url('" + user.image + "') no-repeat" }

  $http.jsonp("http://api.angel.co/1/startups/127295?callback=JSON_CALLBACK").success((response) ->
    $scope.company_info = response
  )

  $http.jsonp("http://api.angel.co/1/startups/127295/roles?callback=JSON_CALLBACK").success((response) ->
    $scope.founders = _.where(response.startup_roles, {role: "founder"})
    $scope.team = _.where(response.startup_roles, {role: "employee"})
    $scope.founders = _.map($scope.founders, (f) ->
      f.tagged
    )
    $scope.team = _.map($scope.team, (f) ->
      f.tagged
    )

    Company.get({id: "joust"}, (company) ->
      users = company.users
      $scope.company = company

      team = _.union(_.where(response.startup_roles, {role: "employee"}), _.where(response.startup_roles, {role: "founder"}))
      yearArray = _.map(team, (r) -> 
        parseInt(r.created_at.substring(0, 4))
      )

      yearArray = _.sortBy(yearArray, (num) ->
        num
      )

      data = []
      yearCounts = _.countBy(yearArray, (num) ->
        num
      )

      for year in _.uniq(yearArray)
        data.push(yearCounts[year])
      
      barChartData = {
        labels : _.uniq(yearArray),
        datasets : [
          {
            fillColor : "rgba(163,84,55,0.7)",
            strokeColor : "rgba(163,84,55,1)",
            data : data
          }
        ]
      }

      myLine = new Chart(document.getElementById("teamGrowth").getContext("2d")).Bar(barChartData)

      # Merge the data we are storing with the data we get from Angellist
      for user in users
        team_member = _.findWhere($scope.founders, {name: user.name})
        if !team_member then team_member = _.findWhere($scope.team, {name: user.name})
        if team_member then _.extend(team_member, user)
    )
  )
])