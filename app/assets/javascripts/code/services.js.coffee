angular.module('SIBJoustServices', ['ngResource']).
  factory('Company', ["$resource", ($resource) ->
    $resource("/companies/:id/:action", {id:'@id', action:'@action'}, { analytics: {method: 'GET'} })
  ]).
  factory('User', ["$resource", ($resource) ->
    $resource("/users/:id", {id:'@id'}, { analytics: {method: 'GET'} })
  ])
