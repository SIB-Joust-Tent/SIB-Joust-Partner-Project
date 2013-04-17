angular.module('SIBJoustDirectives', []).
  directive('SIBTeamPartial', ->
    restrict: 'C',
    replace: false,
    template: JST['companies/team_member']
  )