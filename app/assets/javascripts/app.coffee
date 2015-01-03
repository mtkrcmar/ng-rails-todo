sandshark = angular.module('sandshark', [
  'templates',
  'ngResource',
  'ngRoute',
  'controllers',
  'restangular',
])

sandshark.config(['$routeProvider',
  ($routeProvider) ->
    $routeProvider
    .when('/',
      templateUrl: "index.html"
      controller: 'TodoController'
    )
])

controllers = angular.module('controllers', [])

controllers.controller("ApiController", ['$scope', 'Restangular',
  ($scope, Restangular) ->
    @baselist = Restangular.all('api/v1/todos/')
    @baselist.getList('').then((tasks) ->
      $scope.tasks = tasks)

    $scope.newTask = () ->
    Restangular.all("api/v1/todos").post({title: 'blah'}).then (postedUser) ->
      console.log("Success")
])
