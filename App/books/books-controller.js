angular.module('bookRater')

.controller('BooksCtrl', ['$scope', 'BooksModel', function($scope, BooksModel) {
  var ctrl = this;

  ctrl.loading = false;

  ctrl.getBooks = function() {
    BooksModel.all()
      .then(function(result) {
        console.log(result);
        ctrl.books = result;
      })
      .catch(function(error) {
        console.log("Failed to get books");
        console.log(error);
      });
  };

  ctrl.getBooks();

}]);
