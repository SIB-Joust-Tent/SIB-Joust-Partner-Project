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
  $http.jsonp("http://api.angel.co/1/startups/127295?callback=JSON_CALLBACK").success((response) ->
    $scope.company_info = response
  ).error((data, status, headers, config) ->
    # Jamie: Here. This is causing an error
    i = 0
  )
])