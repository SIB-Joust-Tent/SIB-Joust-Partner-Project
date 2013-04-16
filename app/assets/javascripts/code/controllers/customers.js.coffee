@joustApp.controller 'CustomersCtrl', (['$scope', '$http', ($scope, $http) ->
  $http.get('/trello/joust_board.json', {}).success((response) ->
    # Set the width based on the current window size
    $("#trello-chart").attr('width', $("#trello-chart-holder").width())
    $scope.lists = response.lists
    $scope.cards = response.cards
    $scope.cardsByList = {}
    for list in response.lists
      $scope.cardsByList[list.name] = _.where(response.cards, {idList: list.id})
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

    $http.get('/trello/joust_activity.json', {}).success((response) ->
      $scope.events = []
      for event in response
        card = _.findWhere($scope.cards, {id: event.card_id})
        list = _.findWhere($scope.lists, {id: event.list_id})
        action = "moved"
        if event.event == "createCard" then action = "added"
        if card && list then $scope.events.push({date: event.date.substring(0, 10), action: action, info: "#{card.name} was #{action} to #{list.name}"})
    )
  )
])