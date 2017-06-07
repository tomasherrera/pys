(function () {
    'use strict'; 

    var app = angular.module('pys');

  app.factory('PysNowDataService', ['Restangular', function(Restangular){

  
  var baseUrl = '/api/';
  var pysNowDataService = {};

  

  pysNowDataService.getClients = function ()
  {
    var url = baseUrl + 'clients.json';
    return Restangular.oneUrl('clients', url);

  }

  pysNowDataService.getBills = function ()
  {
    var url = baseUrl + 'bills.json';
    return Restangular.oneUrl('bills', url);

  }

  pysNowDataService.getItems = function ()
  {
    var url = baseUrl + 'items.json';
    return Restangular.oneUrl('items', url);

  }

  pysNowDataService.getClient = function (id)
  {
    var url = baseUrl + 'clients/' + id + '.json';
    return Restangular.oneUrl('clients', url);

  }

  pysNowDataService.saveBill = function (bill)
  {
    var url = baseUrl + 'bills.json';
    return Restangular.all(url).post( bill );

  }

  pysNowDataService.getSales = function ()
  {
    var url = baseUrl + 'sales.json';
    return Restangular.oneUrl('sales', url);

  }

  pysNowDataService.getDates = function ()
  {
    var url = baseUrl + 'dates.json';
    return Restangular.oneUrl('dates', url);

  }

  pysNowDataService.saveSale = function (sale)
  {
    var url = baseUrl + 'sales.json';
    return Restangular.all(url).post( sale );

  }

  pysNowDataService.getCustomers = function ()
  {
    var url = baseUrl + 'customers.json';
    return Restangular.all(url);

  }

  pysNowDataService.updateJob = function (jobToUpdate)
  {
    var url = baseUrl + 'jobs/' + jobToUpdate.id + '.json';
    
    return Restangular.all(url).customPUT(jobToUpdate);
    
  } 
  
  return pysNowDataService;

  
  }]);
}());