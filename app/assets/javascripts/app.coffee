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
    console.log('Getting Started')
])

#controllers.controller("ApiController", ['Restangular', '$resource', '$scope',
#  (Restangular, $resource, $scope) ->
#    Tasks = $resource('/api/v1/todos/:id')
#    $scope.tasks = Tasks.query()
#])

controllers.controller("ApiController", ['$scope', 'Restangular',
  ($scope, Restangular) ->
    $scope.getTasks = () ->
      @baselist = Restangular.all('api/v1/todos/')
      @baselist.getList('').then((tasks) ->
        $scope.tasks = tasks)

    $scope.newTaskTitle = ('')
    $scope.newTask = () ->
      Restangular.one("api/v1").post('todos', (title: $scope.newTaskTitle)).then (postedUser) ->
        @baselist = Restangular.all('api/v1/todos/')
        @baselist.getList('').then((tasks) ->
          $scope.tasks = tasks
          $scope.newTaskTitle = [])

    $scope.deleteTask = (task) ->
      task.remove () ->
        index = $scope.tasks.indexOf(task)
        $scope.tasks.splice(index, 1).then(deletedTask) ->
          @baselist = Restangular.all('api/v1/todos/')
          @baselist.getList('').then($scope.getTasks())
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
