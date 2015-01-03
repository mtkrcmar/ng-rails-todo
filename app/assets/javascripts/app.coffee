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
controllers.controller("TodoController", ['$scope', '$routeParams', '$location',
  ($scope, $routeParams, $location)->
])

#controllers.controller("ApiController", ['Restangular', '$resource', '$scope',
#  (Restangular, $resource, $scope) ->
#    Tasks = $resource('/api/v1/todos/:id')
#    $scope.tasks = Tasks.query()
#])

controllers.controller("ApiController", ['$scope', 'Restangular',
  ($scope, Restangular) ->
    @baselist = Restangular.all('api/v1/todos/')
    @baselist.getList('').then((tasks) ->
      $scope.tasks = tasks)

    $scope.newTask = () ->
    Restangular.all("api/v1/todos").post({title: 'blah'}).then (postedUser) ->
      console.log("Success")
])

#controllers.controller("PostController", ['$scope', 'Restangular',
#  ($scope, Restangular) ->
#    $scope.task = "testing123"
#    #$scope.newTask = () ->
#    #this.post = Restangular.one('api/v1/todos').post(title: "poop")
#    $scope.newTask = () ->
#    Restangular.one("api/v1").post('todos',{task: $scope.task}).then (postedUser) ->
#    console.log("Success")
#])
