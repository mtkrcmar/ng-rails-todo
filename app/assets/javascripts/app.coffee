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
    name: 'Go grocery shopping',
    due: 'This week'
  },
  {
    id: 2,
    name: 'Pay car payment',
    due: 'Tomorrow'

  },
  {
    id: 3
    name: 'Buy dog food',
    due: 'IDK'
  },
  {
    id: 5
    name: 'Eat',
    due: 'Later'
  },
  {
    id: 6
    name: 'Finish reading a book',
    due: '1/2 year'
  },
  {
    id: 7
    name: 'Go to the gym',
    due: 'Every week'
  },
  {
    id: 8
    name: 'Make food',
    due: 'Tonight'
  },
  {
    id: 9
    name: 'Learn how to build JSON API',
    due: 'This year'
  },
  {
    id: 10
    name: 'Deploy to heroku',
    due: 'Already did'
  },
  {
    id: 11
    name: 'Anything',
    due: '64 seconds'
  },
  {
    id: 12
    name: 'Sign up for classes',
    due: 'Yesterday'
  },
]

controllers = angular.module('controllers',[])
controllers.controller("TodoController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.items = todos
])

