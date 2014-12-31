sandshark = angular.module('sandshark', [
  'templates',
  'ngResource',
  'ngRoute',
  'controllers',
])

sandshark.config(['$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/',
      templateUrl: "index.html"
      controller: 'TodoController'
    )
])

controllers = angular.module('controllers', [])
controllers.controller("TodoController", ['$scope', '$routeParams', '$location',
  ($scope, $routeParams, $location)->
])

controllers.controller("ApiController", ['$resource', '$scope',
  ($resource, $scope) ->
    Tasks = $resource('/api/v1/todos')
    $scope.tasks = Tasks.query()
])

