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
    due: '20130403T00:00:00'
  },
  {
    id: 2,
    name: 'Pay car payment',
    due: '20141031T00:00:00'

  },
  {
    id: 3
    name: 'Buy dog food',
    due: '20110221T00:00:00'
  },
  {
    id: 5
    name: 'Eat',
    due: '20140423T00:00:00'
  },
  {
    id: 6
    name: 'Finish reading a book',
    due: '20090513T00:00:00'
  },
  {
    id: 7
    name: 'Go to the gym',
    due: '20210619T00:00:00'
  },
  {
    id: 8
    name: 'Make food',
    due: '19990352T00:00:00'
  },
  {
    id: 9
    name: 'Learn how to build JSON API',
    due: '20220222T00:00:00'
  },
  {
    id: 10
    name: 'Deploy to heroku',
    due: '20141225T00:00:00'
  },
  {
    id: 11
    name: 'Anything',
    due: '29990111T00:00:00'
  },
  {
    id: 12
    name: 'Sign up for classes',
    due: '20140704T00:00:00'
  },
]

controllers = angular.module('controllers',[])
controllers.controller("TodoController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.items = todos
])

