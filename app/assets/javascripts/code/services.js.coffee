angular.module('SIBJoustServices', ['ngResource']).
  factory('Company', ["$resource", ($resource) ->
    $resource("/companies/:id/analytics", {id:'@id'}, { analytics: {method: 'GET'} })
  ]).
  factory('User', ["$resource", ($resource) ->
    $resource("/users/:id", {id:'@id'}, { analytics: {method: 'GET'} })
  ])
