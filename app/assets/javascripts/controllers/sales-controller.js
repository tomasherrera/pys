(function () {
  'use strict';

  var app = angular.module('pys');

  // HOME CONTROLLER
  app.controller("SalesController", ['Restangular', '$scope', '$resource', '$route', '$routeParams', '$location', 'Flash', 'PysNowDataService', function(Restangular, $scope, $resource, $route, $routeParams, $location, Flash, StoreNowDataService) {
    $scope.tabSelected = 'facturacion';

    $scope.pop = function(){
      $('[data-toggle="popover"]').popover();
      $('[rel=popover]').popover({ 
        html : true, 
        content: function() {
          return $('#popover_content_wrapper').html();
        }
      });
    };

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
    //TABS
    $scope.selectTab = function(tab){
      $scope.tabSelected = tab;
    };

    // Key BINDING
    var listener = new window.keypress.Listener();
    $scope.assignKeys = function(){
      listener.simple_combo("v", function() {
        $('#new-sale-button').click();
      });
    };

    $scope.unassignKeys = function(){
      listener.unregister_combo("v");
    };
    // Call basic functions
    $scope.assignKeys();
  }]);//END OF HEADER CONTROLLER

}());