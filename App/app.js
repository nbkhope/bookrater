angular.module('bookRater', ['ui.router'])//, 'templates'])

.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {

  // Define states (routes)
  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home/_home.html',
      //controller: "MainCtrl",
    })

    .state('books', {
      url: '/books',
      templateUrl: 'books/_books.html',
      controller: 'BookCtrl',
      resolve: {
        bookPromise: ['booksFactory', function(booksFactory) {
          return booksFactory.getAll();
        }]
      }
    })

    .state('login', {
      url: '/login',
      templateUrl: 'home/login.templ.html',
      controller: 'LoginCtrl',
      controllerAs: 'ctrl'
    })

    .state('signup', {
      url: '/signup',
      templateUrl: 'home/signup.templ.html',
      // controller: 'SignupCtrl',
      // controllerAs: 'ctrl'
    })

    ;

  // Set default state if no routes match
  $urlRouterProvider.otherwise('home');

}]);

// angular.element(document).ready(function() {
//   angular.bootstrap(document, ['bookRater']);
// });
