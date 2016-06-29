angular.module('bookRater')

.controller('BookCtrl', ['$scope', 'booksFactory', function($scope, booksFactory) {

  $scope.books = booksFactory.books;

}]);
