angular.module('bookRater')

.controller('BookCtrl', ['$scope', '$stateParams', 'BooksModel', function($scope, $stateParams, BooksModel) {
  var ctrl = this;

  ctrl.loading = false;

  ctrl.getBook = function(id) {
    BooksModel.get(id)
      .then(function(result) {
        console.log(result);
        ctrl.book = result;
      })
      .catch(function(error) {
        console.log("Failed to get books");
        console.log(error);
      });
  };

  ctrl.getBook($stateParams.id);

}]);
