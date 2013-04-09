angular.module('SIBJoustServices', ['ngResource']).
  factory('Company', ["$resource", ($resource) ->
    $resource("/companies/:id/analytics", 
      {id:'@id'}, {
        analytics: {method: 'GET'}
      }
    )
  ])
