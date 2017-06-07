(function() {
  var app = angular.module('pys', ['filters.camelcase', "ngResource", 'ngRoute', 'ngAnimate', 'flash', 'templates', 'restangular', '720kb.tooltips']);

  app.config(['$routeProvider', '$httpProvider', function($routeProvider, $httpProvider) {
    // We need this line to send posts.
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
    
    $routeProvider
      .when('/facturacion', {
        templateUrl: 'index.html',
        controller: 'SalesController'
      })
      .when('/clientes', {
        templateUrl: 'sales.html',
        controller: 'SalesController'
      })
      .when('/ventas', {
        templateUrl: 'sales.html',
        controller: 'SalesController'
      })
      .when('/estadisticas', {
        templateUrl: 'sales.html',
        controller: 'SalesController'
      })
      .when('/inventario', {
        templateUrl: 'sales.html',
        controller: 'SalesController'
      })
      .when('/retiros', {
        templateUrl: 'sales.html',
        controller: 'SalesController'
      })
      .when('/citas', {
        templateUrl: 'sales.html',
        controller: 'SalesController'
      })
      ;
  }]);

  app.filter('capitalize', function() {
    return function(input) {
      return (!!input) ? input.charAt(0).toUpperCase() + input.substr(1).toLowerCase() : '';
    }
});
})();