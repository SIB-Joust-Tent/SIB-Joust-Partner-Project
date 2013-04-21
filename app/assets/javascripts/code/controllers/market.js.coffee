@joustApp.controller 'MarketCtrl', (['$scope', ($scope) ->
  doughnutData = [
    {
      value: 75,
      color:"rgba(175,158,118,1)"
    },
    {
      value : 25,
      color : "rgba(175,158,118,0.5)"
    }
  ]

  myDoughnut = new Chart(document.getElementById("doughnutPro").getContext("2d")).Doughnut(doughnutData)

  doughnutData = [
    {
      value: 80,
      color:"rgba(163,84,55,1)"
    },
    {
      value : 20,
      color : "rgba(163,84,55,0.5)"
    }
  ]

  myDoughnut = new Chart(document.getElementById("doughnutPro2").getContext("2d")).Doughnut(doughnutData)
])