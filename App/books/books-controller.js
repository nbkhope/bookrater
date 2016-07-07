angular.module('bookRater')

.controller('BookCtrl', ['$scope', 'booksFactory', function($scope, booksFactory) {
  var ctrl = this;

  ctrl.loading = false;

  ctrl.books = booksFactory.books;

}]);
