@joustApp = angular.module("SIBJoust", ["ui", "SIBJoustServices", "SIBJoustFilters"], ['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode(true)
]).config(['$routeProvider', ($routeProvider) ->
    $routeProvider.
      when('/companies/:id', {template: JST['companies/show'], controller: 'MainCtrl'}).
      when('/companies/:id/analytics', {template: JST['companies/analytics'], controller: 'AnalyticsCtrl'}).
      otherwise({redirectTo: '/companies/:id'})
  ])