@joustApp.controller 'CustomersCtrl', (['$scope', '$http', ($scope, $http) ->
  $http.get('/trello/joust_board.json', {}).success((response) ->
    data = 
      labels : _.map(response.lists, (l) ->
        l.name
      )
      datasets : [
        {
          fillColor : "rgba(151,187,205,0.5)",
          strokeColor : "rgba(151,187,205,1)",
          data : _.map(response.lists, (l) ->
            _.where(response.cards, {idList: l.id}).length 
          )
        }
      ]

    ctx = document.getElementById("trello-chart").getContext("2d")
    new Chart(ctx).Bar(data)
  )
])