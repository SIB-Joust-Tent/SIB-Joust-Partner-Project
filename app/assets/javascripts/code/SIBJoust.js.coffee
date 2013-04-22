@joustApp = angular.module("SIBJoust", ["ui", "SIBJoustServices", "SIBJoustFilters", "SIBJoustDirectives"], ['$locationProvider', ($locationProvider) ->
  $locationProvider.html5Mode(true)
]).config(['$routeProvider', ($routeProvider) ->
    $routeProvider.
      when('/companies/:id', {template: JST['companies/show'], controller: 'MainCtrl'}).
      when('/companies/:id/team', {template: JST['companies/team'], controller: 'MainCtrl'}).
      when('/companies/:id/competitors', {template: JST['companies/competitors'], controller: 'CompetitorsCtrl'}).
      when('/companies/:id/market', {template: JST['companies/market'], controller: 'MarketCtrl'}).
      when('/companies/:id/analytics', {template: JST['companies/analytics'], controller: 'AnalyticsCtrl'}).
      when('/companies/:id/history', {template: JST['companies/history'], controller: 'HistoryCtrl'}).
      when('/companies/:id/customers', {template: JST['companies/customers'], controller: 'CustomersCtrl'}).
      otherwise({redirectTo: '/companies/joust'})
  ])