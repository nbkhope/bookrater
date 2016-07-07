'use strict';

angular.module('bookRater', ['ui.router'])
.constant('ENDPOINT_URI', 'http://localhost:3000/api/')
.config(function($stateProvider, $urlRouterProvider) {

  // Define states (routes)
  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home/_home.html',
      //controller: "MainCtrl",
    })

    .state('books', {
      url: '/books',
      templateUrl: 'books/books.templ.html',
      controller: 'BookCtrl',
      controllerAs: 'ctrl',
      resolve: {
        bookPromise: ['BooksModel', function(BooksModel) {
          return BooksModel.all();
        }]
      }
    })

    .state('books', {
      url: '/books/{id}',
      templareUrl: 'books/book.tmpl.html',
      controller: 'BookCtrl',
      controllerAs: 'ctrl',
      resolve: {
        bookPromise: ['$stateParams', BooksModel, function($stateParams, BooksModel) {
          return BooksModel.get($stateParams.id);
        }]
      }
    })

    ;

  // Set default state if no routes match
  $urlRouterProvider.otherwise('home');

});

// angular.element(document).ready(function() {
//   angular.bootstrap(document, ['bookRater']);
// });
