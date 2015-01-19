sandshark = angular.module('sandshark', [
  'templates',
  'ngResource',
  'ngRoute',
  'controllers',
  'restangular'
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
    console.log('Getting Started')
])

controllers.controller("ApiController", ['$scope', 'Restangular',
  ($scope, Restangular) ->
    @baselist = Restangular.all('api/v1/todos/')
    @baselist.getList('').then((tasks) ->
      $scope.tasks = tasks)

    $scope.newTaskTitle = ('')
    $scope.newTaskDate = ('')
    $scope.newTaskComplete = false
    $scope.newTask = () ->
      Restangular.one("api/v1").post('todos',
        (title: $scope.newTaskTitle, due: $scope.newTaskDate, completed: $scope.newTaskComplete)).then (postedUser) ->
      @baselist = Restangular.all('api/v1/todos/')
      @baselist.getList('').then((tasks) ->
        $scope.tasks = tasks
        $scope.newTaskTitle = [])

    $scope.deleteTask = (task) ->
      task.remove () ->
        index = $scope.tasks.indexOf(task)
        $scope.tasks.splice(index, 1)
      @baselist = Restangular.all('api/v1/todos/')
      @baselist.getList('').then((tasks) ->
        $scope.tasks = tasks)

#    $scope.completedRadio = false
#    $scope.completeTask = (task) ->
#      task.update() ->
#        index = $scope.tasks.indexOf(task)
#        Restangular.one("api/v1/todos").post('index', (due: $scope.completedRadio))
])
