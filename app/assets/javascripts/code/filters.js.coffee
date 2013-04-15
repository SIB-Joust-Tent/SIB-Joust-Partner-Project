angular.module('SIBJoustFilters', []).
  filter('roundFloat', [() ->
    (num) ->
      Math.round( num * 100 ) / 100
  ])