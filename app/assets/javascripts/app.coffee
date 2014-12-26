sandshark = angular.module('sandshark',[
  'templates',
  'ngRoute',
  'controllers',
])

sandshark.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/',
      templateUrl: "index.html"
      controller: 'TodoController'
    )
])

todos = [
  {
    id: 1
    name: 'Go grocery shopping'
  },
  {
    id: 2
    name: 'Pay car payment',
  },
  {
    id: 3
    name: 'Buy dog food',
  },
  {
    id: 4
    name: 'Return broken item with FEDEX',
  },
]

controllers = angular.module('controllers',[])
controllers.controller("TodoController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.todos = todos.filter (todo)-> todo.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.todos = []
])

