'use strict';

angular.module('bookRater', ['ui.router'])
.constant('ENDPOINT_URI', 'http://localhost:3000/api/')
.config(function($stateProvider, $urlRouterProvider) {

  // Define states (routes)
  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home/home.templ.html',
      controller: "MainCtrl",
      controllerAs: 'main',
    })

    .state('books', {
      url: '/books',
      templateUrl: 'books/books.templ.html',
      controller: 'BooksCtrl',
      controllerAs: 'ctrl',
      // resolve: {
      //   bookPromise: ['BooksModel', function(BooksModel) {
      //     return BooksModel.all();
      //   }]
      // }
    })

    .state('books.detail', {
      url: '/books/:id',
      templareUrl: 'books/book.tmpl.html',
      controller: 'BookCtrl',
      controllerAs: 'ctrl',
      // resolve: {
      //   bookPromise: ['$stateParams', BooksModel, function($stateParams, BooksModel) {
      //     return BooksModel.get($stateParams.id);
      //   }]
      // }
    })

    ;

  // Set default state if no routes match
  $urlRouterProvider.otherwise('books');

});

// angular.element(document).ready(function() {
//   angular.bootstrap(document, ['bookRater']);
// });
