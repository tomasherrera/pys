(function () {
  'use strict';

  var app = angular.module('pys');

  // HOME CONTROLLER
  app.controller("SalesController", ['Restangular', '$scope', '$interval', '$resource', '$route', '$routeParams', '$location', 'Flash', 'PysNowDataService', function(Restangular, $scope, $interval, $resource, $route, $routeParams, $location, Flash, PysNowDataService) {
    $scope.tabSelected = 'facturacion';
    $scope.selectedClient = null;
    $scope.isClientSelected = false;
    $scope.selectedPayment = "credito";
    $scope.bill_creation = false;
    $scope.showClient = true;
    $scope.selectedItemBill;
    //$interval(function(){
    //  $scope.getBills();
    //},3000);

    $scope.selectClient = function(client_id){
      $scope.getClient(client_id);
    };

    $scope.selectPayment = function(payment_type){
      $scope.selectedPayment = payment_type; 
    };

    $scope.selectItem = function(item){
      $scope.selectedItemBill = item;
    };

    $scope.changeClient = function(){
      $scope.selectedClient = null; 
      $scope.isClientSelected = false;
    };

    $scope.startBillCreation = function(){
      $scope.bill_creation = true;
      $scope.getItems();
    };

    $scope.showOrHideClient = function(){
      $scope.showClient = !$scope.showClient;
    };

    $scope.cancelBillCreation = function(){
      $scope.getBills();
      $scope.bill_creation = false;
    };

    $scope.pop = function(){
      $('[data-toggle="popover"]').popover();
      $('[rel=popover]').popover({ 
        html : true, 
        content: function() {
          return $('#popover_content_wrapper').html();
        }
      });
    };

    //DB
    $scope.getClient = function(id){
      PysNowDataService.getClient(id).get().then(function(response) {
        $scope.selectedClient = response.plain()["client"];
        $scope.isClientSelected = true;
      });  
    };

    $scope.getClients = function(){
      PysNowDataService.getClients().getList().then(function(response) {
        $scope.clients = response.plain();
      });  
    };

    $scope.getItems = function(){
      PysNowDataService.getItems().getList().then(function(response) {
        $scope.items = response.plain();
      });  
    };

    $scope.getBills = function(){
      PysNowDataService.getBills().getList().then(function(response) {
        $scope.bills = response.plain();
      });  
    };

    $scope.saveBillDraft = function(){
      $scope.bill = {client_id:$scope.selectedClient.id, status:"Borrador", payment_form: $scope.selectedPayment};
      PysNowDataService.saveBill($scope.bill).then(function(response) {
          $scope.draft_bill = response.bill;
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
    $scope.getBills();
  }]);//END OF HEADER CONTROLLER

}());